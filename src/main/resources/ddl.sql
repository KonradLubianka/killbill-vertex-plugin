/*
 * Copyright 2020-2023 Equinix, Inc
 * Copyright 2020-2023 The Billing Project, LLC
 *
 * The Billing Project licenses this file to you under the Apache License, version 2.0
 * (the "License"); you may not use this file except in compliance with the
 * License.  You may obtain a copy of the License at:
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the
 * License for the specific language governing permissions and limitations
 * under the License.
 */

/*! SET default_storage_engine=INNODB */;

drop table if exists vertex_responses;
create table vertex_responses (
  record_id serial unique
, kb_account_id char(36) not null
, kb_invoice_id char(36) not null
, kb_invoice_item_ids longtext default null
, doc_code varchar(255) default null
, doc_date datetime default null
, timestamp datetime default null
, total_amount numeric(15,9) default null
, total_discount numeric(15,9) default null
, total_exemption numeric(15,9) default null
, total_taxable numeric(15,9) default null
, total_tax numeric(15,9) default null
, total_tax_calculated numeric(15,9) default null
, tax_date datetime default null
, tax_lines longtext default null
, tax_summary longtext default null
, tax_addresses longtext default null
, result_code varchar(255) default null
, messages longtext default null
, additional_data longtext default null
, created_date datetime not null
, kb_tenant_id char(36) not null
, primary key(record_id)
) /*! CHARACTER SET utf8 COLLATE utf8_bin */;
create index vertex_responses_kb_account_id on vertex_responses(kb_account_id);
create index vertex_responses_kb_invoice_id on vertex_responses(kb_invoice_id);
