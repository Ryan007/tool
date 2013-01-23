# encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
admin = User.create({ username: 'admin', email: 'zhanghuaxun@xiaoma.com',
                password: '1q2w3e4r', password_confirmation: '1q2w3e4r', confirmed_at: '2013-01-16 11:45:32' ,
                confirmation_sent_at: '2013-01-18 11:45:07',created_at: '2013-01-16 11:45:07',updated_at: '2013-01-16 11:45:32' })


superadmin_role = Role.create({
                name: 'SuperAdmin', desc: '最高权限管理员'
        })

admin.roles << superadmin_role

super_permission = Permission.create({
        name: 'Everything', action: 'manage', subject_class: 'all', desc: 'All operations'
        })

superadmin_role.permissions << super_permission