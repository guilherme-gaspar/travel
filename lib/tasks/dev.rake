namespace :dev do
  ##########################################################
  desc "Setup development"
  task setup: :environment do
    puts "Executando o setup para desenvolvimento..."

    puts "APAGANDO BD... #{%x(rake db:drop)}"
    puts "CRIANDO BD... #{%x(rake db:create)}"
    puts %x(rake db:migrate)
    # puts %x(rake db:seed)
    puts %x(rake dev:create_admin)
    puts %x(rake dev:create_university)
    puts %x(rake dev:create_users)
    puts %x(rake dev:create_drivers)
    puts %x(rake dev:create_cars)
    puts "Setup completado com sucesso"
  end
  ##########################################################
  ##########################################################
  desc "Cria administradores padrão"
  task create_admin: :environment do
    puts "CADASTRANDO O ADMIN PADRÃO"
        Admin.create!(
          email: 'admin@admin.com',
          password: "123456",
          password_confirmation: "123456",
          cnpj: "12.123.123/1234-12",
          fantasy_name: "Empresa do Guilherme"
        )
    puts "ADMIN PADRÃO CADASTRADO COM SUCESSO!"
  end
  ##########################################################
  ##########################################################
  desc "Cria universidades falsas"
  task create_university: :environment do
    puts "Cadastrando as universidades"
      5.times do
        university = University.create!(
          name: Faker::Pokemon.name,
          city: Faker::Pokemon.location,
          admin: Admin.find(1)
        )
      end
  end
  ##########################################################
  ##########################################################
  desc "Cria usuários falsos"
  task create_users: :environment do
    puts "Cadastrando os usuários falsos"
      5.times do
        user = User.create!(
          email: Faker::Internet.email,
          password: "123456",
          password_confirmation: "123456",
          name: Faker::OnePiece.character,
          state: "RS",
          city: "Capão da Canoa",
          number: "1865",
          phone: Faker::PhoneNumber.phone_number,
          street: "Avenida paraguassu",
          university: University.find([1,2,3,4,5].sample),
          admin: Admin.find(1),
          created_at: Date.today-[1,2,3,4,5].sample
        )
        contract = Contract.create!(
          due_date: [10,20,30],
          number_installments: [1,2,3,4,5].sample,
          value: 100.00,
          user: user,
          admin: Admin.find(1)
        )
        invoice = Invoice.create!(
          due_date: ["10/10/10","12/12/12","11/11/11"].sample,
          status: [0,1].sample,
          contract: contract,
          value: [10, 20, 30, 40, 50].sample
        )
        week = Week.create!(
          mond: "M",
          tues: "M",
          wedn: "M",
          thur: "M",
          frid: "M",
          satu: "M",
          user_id: user.id
        )

      end
    puts "Usuários falsos cadastrados com sucesso"
  end
  ##########################################################
  ##########################################################
  desc "Cria motoristas falsos"
  task create_drivers: :environment do
    puts "Cadastrando os motoristas falsos"
      5.times do
        driver = Driver.create!(
          email: Faker::Internet.email,
          name: Faker::Name.first_name,
          admin: Admin.find(1)
        )
      end
    puts "Motoristas falsos cadastrados com sucesso"
  end
  ##########################################################
  ##########################################################
  ##########################################################
  desc "Cria carros falsos"
  task create_cars: :environment do
    puts "Cadastrando os Carros falsos"
      5.times do
        car = Car.create!(
          capacity: [1,2,3,4,5,6,7,8,9,10].sample,
          plate: [1234,1251,6135,1356,1356].sample,
          model: Faker::OnePiece.character,
          year: [2000,2001,2003,2005,2009].sample,
          mark: Faker::Pokemon.name,
          admin: Admin.find(1)
        )
      end
    puts "Carros falsos cadastrados com sucesso"
  end
  ##########################################################
  ##########################################################

end
