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
    puts %x(rake dev:create_users)
    puts %x(rake dev:create_drivers)
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
          password_confirmation: "123456"
        )
    puts "ADMIN PADRÃO CADASTRADO COM SUCESSO!"
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
          admin: Admin.find(1)
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
          password: "123456",
          password_confirmation: "123456",
          name: Faker::Name.first_name
        )
      end
    puts "Motoristas falsos cadastrados com sucesso"
  end
  ##########################################################
  ##########################################################

end
