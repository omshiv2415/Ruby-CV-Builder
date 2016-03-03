# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160303152806) do

  create_table "educatioal_qualifications", force: :cascade do |t|
    t.integer  "idEducationalQualification"
    t.integer  "Persons_idUser",                     limit: 10
    t.string   "qualificationType",                  limit: 16
    t.string   "courseName",                         limit: 100
    t.integer  "EducationalLevels_idEducationLevel", limit: 3
    t.string   "vocational",                         limit: 1
    t.string   "mainSubject",                        limit: 45
    t.string   "nameOfInstitutions",                 limit: 100
    t.string   "country",                            limit: 45
    t.date     "yearObtained"
    t.string   "result",                             limit: 20
    t.string   "thesesTitle",                        limit: 200
    t.integer  "verified",                           limit: 1
    t.string   "howVerified",                        limit: 45
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.integer  "user_id"
  end

  create_table "experiences", force: :cascade do |t|
    t.integer  "idExperiences"
    t.integer  "Persons_idUser",                        limit: 10
    t.date     "dateStarted"
    t.date     "dateFinished"
    t.integer  "JobTitles_idJobTitles",                 limit: 6
    t.string   "otherJobTitle",                         limit: 45
    t.string   "keyDuties",                             limit: 255
    t.integer  "EmploymentLevels_idLevelsOfEmployment", limit: 4
    t.string   "employerName",                          limit: 45
    t.integer  "verified",                              limit: 1
    t.string   "howVerified",                           limit: 45
    t.integer  "user_id"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
  end

  create_table "people", force: :cascade do |t|
    t.string   "title",                             limit: 10
    t.string   "forename1",                         limit: 45
    t.string   "forename2",                         limit: 45
    t.string   "surname",                           limit: 45
    t.string   "addressLine1",                      limit: 45
    t.string   "addressLine2",                      limit: 45
    t.string   "town",                              limit: 45
    t.string   "postcode",                          limit: 10
    t.string   "secondEmail",                       limit: 50
    t.string   "personalUrl",                       limit: 64
    t.binary   "photo"
    t.string   "female"
    t.string   "postcodeStart",                     limit: 10
    t.string   "authorityToWorkStatement",          limit: 255
    t.string   "contactPreference"
    t.integer  "EducationalLevels_idEducatonLevel"
    t.integer  "noOfGcses"
    t.string   "gecseEnglishGrade",                 limit: 2
    t.string   "gcseMathsGrade",                    limit: 2
    t.integer  "fiveOrMoreGcses",                   limit: 2
    t.integer  "noOfAlevels",                       limit: 4
    t.integer  "ucasPoints",                        limit: 4
    t.string   "studentStatus",                     limit: 15
    t.string   "mobile",                            limit: 16
    t.string   "landline",                          limit: 16
    t.date     "dob"
    t.integer  "penaltyPoints",                     limit: 4
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.integer  "user_id"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "referees", force: :cascade do |t|
    t.integer  "idReferees",          limit: 10
    t.integer  "Persons_idUser",      limit: 10
    t.string   "title",               limit: 10
    t.string   "forename",            limit: 45
    t.string   "surname",             limit: 45
    t.string   "email",               limit: 50
    t.string   "contactPhone",        limit: 16
    t.string   "relationship",        limit: 50
    t.integer  "permissionToContact", limit: 1
    t.integer  "verified",            limit: 1
    t.string   "howVerified",         limit: 45
    t.string   "referenceDoc"
    t.integer  "user_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "skills", force: :cascade do |t|
    t.integer  "idSkills"
    t.integer  "Person_idUser", limit: 10
    t.string   "skillName",     limit: 100
    t.string   "skillLevel"
    t.integer  "verified",      limit: 1
    t.string   "howVerified",   limit: 45
    t.integer  "user_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false
    t.boolean  "employee",               default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
