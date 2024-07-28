class Config < ActiveRecord::Migration[7.2]
  def change
    create_table :configs do |t|
      t.string :lotw_download_url
      t.string :lotw_upload_url
      t.string :lotw_rcvd_mark
      t.string :lotw_login_url
      t.string :eqsl_download_url
      t.string :eqsl_rcvd_mark
      t.string :clublog_download_url
      t.string :clublog_upload_url
      t.string :clublog_rcvd_mark
      t.string :clublog_login_url

      t.timestamps
    end
  end
end
