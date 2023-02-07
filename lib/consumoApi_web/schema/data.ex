defmodule ConsumoApiWeb.Schema.Data do
  use Ecto.Schema
  import Ecto.Changeset

  schema "data" do
    field :cdr_id, :string
    field :cdr_sub_id, :string
    field :cdr_type, :string
    field :split_cdr_reason, :string
    field :cdr_batch_id, :string
    field :src_rec_line_no, :string
    field :src_cdr_id, :string
    field :src_cdr_no, :string
    field :status, :string
    field :re_rating_times, :string
    field :create_date, :string
    field :start_date, :string
    field :end_date, :string
    field :cust_local_start_date, :string
    field :cust_local_end_date, :string
    field :std_evt_type_id, :string
    field :evt_source_category, :string
    field :obj_type, :string
    field :obj_id, :string
    field :owner_cust_id, :string
    field :default_acct_id, :string
    field :pri_identity, :string
    field :bill_cycle_id, :string
    field :service_category, :string
    field :usage_service_type, :string
    field :session_id, :string
    field :result_code, :string
    field :result_reason, :string
    field :be_id, :string
    field :hot_seq, :string
    field :cp_id, :string
    field :recipient_number, :string
    field :usage_measure_id, :string
    field :actual_usage, :string
    field :rate_usage, :string
    field :service_unit_type, :string
    field :usage_measure_id2, :string
    field :actual_usage2, :string
    field :rate_usage2, :string
    field :service_unit_type2, :string
    field :debit_amount, :string
    field :reserved_1, :string
    field :debit_from_prepaid, :string
    field :debit_from_advance_prepaid, :string
    field :debit_from_postpaid, :string
    field :debit_from_advance_postpaid, :string
    field :debit_from_credit_postpaid, :string
    field :total_tax, :string
    field :free_unit_amount_of_times, :string
    field :free_unit_amount_of_duration, :string
    field :free_unit_amount_of_flux, :string
    field :acct_id_1, :string
    field :acct_balance_id_1, :string
    field :balance_type_1, :string
    field :cur_balance_1, :string
    field :chg_balance_1, :string
    field :currency_id_1, :string
    field :oper_type_1, :string
    field :acct_id_2, :string
    field :acct_balance_id_2, :string
    field :balance_type_2, :string
    field :cur_balance_2, :string
    field :chg_balance_2, :string
    field :currency_id_2, :string
    field :oper_type_2, :string
    field :acct_id_3, :string
    field :acct_balance_id_3, :string
    field :balance_type_3, :string
    field :cur_balance_3, :string
    field :chg_balance_3, :string
    field :currency_id_3, :string
    field :oper_type_3, :string
    field :acct_id_4, :string
    field :acct_balance_id_4, :string
    field :balance_type_4, :string
    field :cur_balance_4, :string
    field :chg_balance_4, :string
    field :currency_id_4, :string
    field :oper_type_4, :string
    field :acct_id_5, :string
    field :acct_balance_id_5, :string
    field :balance_type_5, :string
    field :cur_balance_5, :string
    field :chg_balance_5, :string
    field :currency_id_5, :string
    field :oper_type_5, :string
    field :acct_id_6, :string
    field :acct_balance_id_6, :string
    field :balance_type_6, :string
    field :cur_balance_6, :string
    field :chg_balance_6, :string
    field :currency_id_6, :string
    field :oper_type_6, :string
    field :acct_id_7, :string
    field :acct_balance_id_7, :string
    field :balance_type_7, :string
    field :cur_balance_7, :string
    field :chg_balance_7, :string
    field :currency_id_7, :string
    field :oper_type_7, :string
    field :acct_id_8, :string
    field :acct_balance_id_8, :string
    field :balance_type_8, :string
    field :cur_balance_8, :string
    field :chg_balance_8, :string
    field :currency_id_8, :string
    field :oper_type_8, :string
    field :acct_id_9, :string
    field :acct_balance_id_9, :string
    field :balance_type_9, :string
    field :cur_balance_9, :string
    field :chg_balance_9, :string
    field :currency_id_9, :string
    field :oper_type_9, :string
    field :acct_id_10, :string
    field :acct_balance_id_10, :string
    field :balance_type_10, :string
    field :cur_balance_10, :string
    field :chg_balance_10, :string
    field :currency_id_10, :string
    field :oper_type_10, :string
    field :fu_own_type_1, :string
    field :fu_own_id_1, :string
    field :free_unit_id_1, :string
    field :free_unit_type_1, :string
    field :cur_amount_1, :string
    field :chg_amount_1, :string
    field :fu_measure_id_1, :string
    field :oper_type_11, :string
    field :fu_own_type_2, :string
    field :fu_own_id_2, :string
    field :free_unit_id_2, :string
    field :free_unit_type_2, :string
    field :cur_amount_2, :string
    field :chg_amount_2, :string
    field :fu_measure_id_2, :string
    field :oper_type_12, :string
    field :fu_own_type_3, :string
    field :fu_own_id_3, :string
    field :free_unit_id_3, :string
    field :free_unit_type_3, :string
    field :cur_amount_3, :string
    field :chg_amount_3, :string
    field :fu_measure_id_3, :string
    field :oper_type_13, :string
    field :fu_own_type_4, :string
    field :fu_own_id_4, :string
    field :free_unit_id_4, :string
    field :free_unit_type_4, :string
    field :cur_amount_4, :string
    field :chg_amount_4, :string
    field :fu_measure_id_4, :string
    field :oper_type_14, :string
    field :fu_own_type_5, :string
    field :fu_own_id_5, :string
    field :free_unit_id_5, :string
    field :free_unit_type_5, :string
    field :cur_amount_5, :string
    field :chg_amount_5, :string
    field :fu_measure_id_5, :string
    field :oper_type_15, :string
    field :fu_own_type_6, :string
    field :fu_own_id_6, :string
    field :free_unit_id_6, :string
    field :free_unit_type_6, :string
    field :cur_amount_6, :string
    field :chg_amount_6, :string
    field :fu_measure_id_6, :string
    field :oper_type_16, :string
    field :fu_own_type_7, :string
    field :fu_own_id_7, :string
    field :free_unit_id_7, :string
    field :free_unit_type_7, :string
    field :cur_amount_7, :string
    field :chg_amount_7, :string
    field :fu_measure_id_7, :string
    field :oper_type_17, :string
    field :fu_own_type_8, :string
    field :fu_own_id_8, :string
    field :free_unit_id_8, :string
    field :free_unit_type_8, :string
    field :cur_amount_8, :string
    field :chg_amount_8, :string
    field :fu_measure_id_8, :string
    field :oper_type_18, :string
    field :fu_own_type_9, :string
    field :fu_own_id_9, :string
    field :free_unit_id_9, :string
    field :free_unit_type_9, :string
    field :cur_amount_9, :string
    field :chg_amount_9, :string
    field :fu_measure_id_9, :string
    field :oper_type_19, :string
    field :fu_own_type_10, :string
    field :fu_own_id_10, :string
    field :free_unit_id_10, :string
    field :free_unit_type_10, :string
    field :cur_amount_10, :string
    field :chg_amount_10, :string
    field :fu_measure_id_10, :string
    field :oper_type_20, :string
    field :acct_id_11, :string
    field :acct_balance_id_11, :string
    field :balance_type_11, :string
    field :bonus_amount_1, :string
    field :current_balance_1, :string
    field :currency_id_11, :string
    field :oper_type_21, :string
    field :acct_id_12, :string
    field :acct_balance_id_12, :string
    field :balance_type_12, :string
    field :bonus_amount_2, :string
    field :current_balance_2, :string
    field :currency_id_12, :string
    field :oper_type_22, :string
    field :acct_id_13, :string
    field :acct_balance_id_13, :string
    field :balance_type_13, :string
    field :bonus_amount_3, :string
    field :current_balance_3, :string
    field :currency_id_13, :string
    field :oper_type_23, :string
    field :acct_id_14, :string
    field :acct_balance_id_14, :string
    field :balance_type_14, :string
    field :bonus_amount_4, :string
    field :current_balance_4, :string
    field :currency_id_14, :string
    field :oper_type_24, :string
    field :acct_id_15, :string
    field :acct_balance_id_15, :string
    field :balance_type_15, :string
    field :bonus_amount_5, :string
    field :current_balance_5, :string
    field :currency_id_15, :string
    field :oper_type_25, :string
    field :acct_id_16, :string
    field :acct_balance_id_16, :string
    field :balance_type_16, :string
    field :bonus_amount_6, :string
    field :current_balance_6, :string
    field :currency_id_16, :string
    field :oper_type_26, :string
    field :acct_id_17, :string
    field :acct_balance_id_17, :string
    field :balance_type_17, :string
    field :bonus_amount_7, :string
    field :current_balance_7, :string
    field :currency_id_17, :string
    field :oper_type_27, :string
    field :acct_id_18, :string
    field :acct_balance_id_18, :string
    field :balance_type_18, :string
    field :bonus_amount_8, :string
    field :current_balance_8, :string
    field :currency_id_18, :string
    field :oper_type_28, :string
    field :acct_id_19, :string
    field :acct_balance_id_19, :string
    field :balance_type_19, :string
    field :bonus_amount_9, :string
    field :current_balance_9, :string
    field :currency_id_19, :string
    field :oper_type_29, :string
    field :acct_id_20, :string
    field :acct_balance_id_20, :string
    field :balance_type_20, :string
    field :bonus_amount_10, :string
    field :current_balance_10, :string
    field :currency_id_20, :string
    field :oper_type_30, :string
    field :fu_own_type_11, :string
    field :fu_own_id_11, :string
    field :free_unit_type_11, :string
    field :free_unit_id_11, :string
    field :bonus_amount_11, :string
    field :current_amount_1, :string
    field :fu_measure_id_11, :string
    field :oper_type_31, :string
    field :fu_own_type_12, :string
    field :fu_own_id_12, :string
    field :free_unit_type_12, :string
    field :free_unit_id_12, :string
    field :bonus_amount_12, :string
    field :current_amount_2, :string
    field :fu_measure_id_12, :string
    field :oper_type_32, :string
    field :fu_own_type_13, :string
    field :fu_own_id_13, :string
    field :free_unit_type_13, :string
    field :free_unit_id_13, :string
    field :bonus_amount_13, :string
    field :current_amount_3, :string
    field :fu_measure_id_13, :string
    field :oper_type_33, :string
    field :fu_own_type_14, :string
    field :fu_own_id_14, :string
    field :free_unit_type_14, :string
    field :free_unit_id_14, :string
    field :bonus_amount_14, :string
    field :current_amount_4, :string
    field :fu_measure_id_14, :string
    field :oper_type_34, :string
    field :fu_own_type_15, :string
    field :fu_own_id_15, :string
    field :free_unit_type_15, :string
    field :free_unit_id_15, :string
    field :bonus_amount_15, :string
    field :current_amount_5, :string
    field :fu_measure_id_15, :string
    field :oper_type_35, :string
    field :fu_own_type_16, :string
    field :fu_own_id_16, :string
    field :free_unit_type_16, :string
    field :free_unit_id_16, :string
    field :bonus_amount_16, :string
    field :current_amount_6, :string
    field :fu_measure_id_16, :string
    field :oper_type_36, :string
    field :fu_own_type_17, :string
    field :fu_own_id_17, :string
    field :free_unit_type_17, :string
    field :free_unit_id_17, :string
    field :bonus_amount_17, :string
    field :current_amount_7, :string
    field :fu_measure_id_17, :string
    field :oper_type_37, :string
    field :fu_own_type_18, :string
    field :fu_own_id_18, :string
    field :free_unit_type_18, :string
    field :free_unit_id_18, :string
    field :bonus_amount_18, :string
    field :current_amount_8, :string
    field :fu_measure_id_18, :string
    field :oper_type_38, :string
    field :fu_own_type_19, :string
    field :fu_own_id_19, :string
    field :free_unit_type_19, :string
    field :free_unit_id_19, :string
    field :bonus_amount_19, :string
    field :current_amount_9, :string
    field :fu_measure_id_19, :string
    field :oper_type_39, :string
    field :fu_own_type_20, :string
    field :fu_own_id_20, :string
    field :free_unit_type_20, :string
    field :free_unit_id_20, :string
    field :bonus_amount_20, :string
    field :current_amount_10, :string
    field :fu_measure_id_20, :string
    field :oper_type_40, :string
    field :callingpartynumber, :string
    field :apn, :string
    field :url, :string
    field :callingpartyimsi, :string
    field :accessnetworkaddress, :string
    field :ggsnaddress, :string
    field :callingroaminfo, :string
    field :callingcellid, :string
    field :timestampofsgsn, :string
    field :timezoneofsgsn, :string
    field :bearercapability, :string
    field :chargingtime, :string
    field :totalflux, :string
    field :upflux, :string
    field :downflux, :string
    field :elapseduration, :string
    field :imei, :string
    field :serviceid, :string
    field :spid, :string
    field :categoryid, :string
    field :contentid, :string
    field :qos, :string
    field :bearerprotocoltype, :string
    field :starttime, :string
    field :stoptime, :string
    field :chargingid, :string
    field :transitionid, :string
    field :servicelevel, :string
    field :brandid, :string
    field :mainofferingid, :string
    field :chargingpartynumber, :string
    field :paytype, :string
    field :chargingtype, :string
    field :roamstate, :string
    field :callinghomecountrycode, :string
    field :callinghomeareanumber, :string
    field :callinghomenetworkcode, :string
    field :callingroamcountrycode, :string
    field :callingroamareanumber, :string
    field :callingroamnetworkcode, :string
    field :servicetype, :string
    field :callingnetworktype, :string
    field :callingvpntopgroupnumber, :string
    field :callingvpngroupnumber, :string
    field :onlinechargingflag, :string
    field :starttimeofbillcycle, :string
    field :lasteffectoffering, :string
    field :dtdiscount, :string
    field :ratinggroup, :string
    field :homezoneid, :string
    field :specialzoneid, :string
    field :datazoneid, :string
    field :mainbalanceinfo, :string
    field :chgbalanceinfo, :string
    field :chgfreeunitinfo, :string
    field :userstate, :string
    field :grouppayflag, :string
    field :rattype, :string
    field :chargepartyindicator, :string
    field :roamingzoneid, :string
    field :primaryofferchgamt, :string
    field :reserved_4, :string
    field :fu_charging_offerid, :string
    field :fu_bonus_offerid, :string
    field :filler, :string
  end

  def changeset(sms, attrs) do
    sms
    |> cast(attrs, [:cdr_id])
    |> validate_required([:cdr_id])
  end
end