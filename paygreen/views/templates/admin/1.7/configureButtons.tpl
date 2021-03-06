{*
* 2014 - 2015 Watt Is It
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author    PayGreen <contact@paygreen.fr>
*  @copyright 2014-2014 Watt It Is
*  @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*
*}
<script type="text/javascript" src="/modules/paygreen/views/js/1.7/back.js"></script>
<div class="panel">
    <div class="panel-heading">
        <i class="icon-image"></i> {l s='Configuration Payment Butons' mod='paygreen'}
    </div>
    <div class="row">
        {foreach from=$buttons key=key item=btn}
            <div class="col-lg-4 col-sm-6 col-md-6 col-xs-12">
                <form id="paygreen_btn_form" class="form-horizontal" action="#" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="id" value="{$btn['id']|escape:'html':'UTF-8'}">
                    <fieldset>
                        <!-- Form Name -->
                        <legend>
                            {if $btn['id'] > 0}
                                {$btn['label']|escape:'htmlall':'UTF-8'}
                            {else}
                                {l s='New button' mod='paygreen'}
                            {/if}</legend>
                            {if isset($btn['error'])}
                                <div class="alert alert-warning">
                                    <strong>{$btn['error']|escape:'htmlall':'UTF-8'}</strong>
                                </div>
                            {/if}
                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="label">{l s='Button label' mod='paygreen'}</label>
                            <div class="col-md-7">
                                <input id="label" name="label" type="text"
                                       placeholder="{l s='Button label' mod='paygreen'}" class="form-control input-md"
                                       required="required" value="{$btn['label']|escape:'html':'UTF-8'}" maxlength="30">
                                <span class="help-block">{l s='Text displayed to the right of the icon' mod='paygreen'}</span>
                            </div>
                        </div>

                        <!-- File Button -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="image">{l s='icon' mod='paygreen'}</label>
                            <div class="col-md-7">
                                <input id="image" name="image" class="input-file" type="file">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-md-4 control-label" for="label">{l s='Image used' mod='paygreen'}</label>
                            <div class="col-md-7 text-center">
                                {if $btn['image'] > ""}
                                    <a href="{$icondir|escape:'html':'UTF-8'}{$btn['image']|escape:'html':'UTF-8'}"
                                       target="_blank" title="{l s='Image used' mod='paygreen'}"><img
                                                src="{$icondir|escape:'html':'UTF-8'}{$btn['image']|escape:'html':'UTF-8'}"
                                                style="max-height:40px;"/></a>
                                {else}
                                    <img src="{$icondir|escape:'html':'UTF-8'}paygreen_paiement1_7.png"
                                         style="max-height:40px;"/>
                                {/if}
                            </div>
                        </div>
                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label"
                                   for="displayType">{l s='Display type' mod='paygreen'}</label>
                            <div class="col-md-7">
                                <select id="displayType" name="displayType" class="form-control">
                                    <option value="1"{if $btn['displayType'] == '1'} selected="selected"{/if}>{l s='Image' mod='paygreen'}</option>
                                    <option value="2"{if $btn['displayType'] == '2'} selected="selected"{/if}>{l s='Label' mod='paygreen'}</option>
                                    <option value="3"{if $btn['displayType'] == '3'} selected="selected"{/if}>{l s='Label + Image' mod='paygreen'}</option>
                                </select>
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label"
                                   for="position">{l s='Display Order' mod='paygreen'}</label>
                            <div class="col-md-7">
                                <input id="position" name="position" min="0" type="number" placeholder=""
                                       class="form-control input-md" value="{$btn['position'|escape:'html':'UTF-8']}">
                                <span class="help-block">{l s='if empty, the position will be automatic' mod='paygreen'}</span>
                            </div>
                        </div>

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label"
                                   for="integration">{l s='Integration type' mod='paygreen'}</label>
                            <div class="col-md-7">
                                <select id="integration" name="integration" class="form-control">
                                    <option value="0"{if $btn['integration'] == '0'} selected="selected"{/if}>{l s='External Payment' mod='paygreen'}</option>
                                    <option value="1"{if $btn['integration'] == '1'} selected="selected"{/if}>{l s='IFrame Payment' mod='paygreen'}</option>
                                </select>
                                <span class="help-block">{l s='if SSL is disabled, all butons IFrame will be disabled' mod='paygreen'}</span>
                            </div>
                        </div>

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label"
                                   for="displayType">{l s='Payment type' mod='paygreen'}</label>
                            <div class="col-md-7">
                                <select id="executedAt" name="executedAt" class="form-control">
                                    <option value="0"{if $btn['executedAt'] == '0'} selected="selected"{/if}>{l s='Cash' mod='paygreen'}</option>
                                    <option value="1"{if $btn['executedAt'] == '1'} selected="selected"{/if}>{l s='Subscription' mod='paygreen'}</option>
                                    <option value="3"{if $btn['executedAt'] == '3'} selected="selected"{/if}>{l s='In installments' mod='paygreen'}</option>
                                    <option value="-1"{if $btn['executedAt'] == '-1'} selected="selected"{/if}>{l s='At the delivery' mod='paygreen'}</option>
                                </select>
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label"
                                   for="nbPayment" id="labelNbPayment">{l s='Number of installments' mod='paygreen'}</label>
                            <div class="col-md-7">
                                <input id="nbPayment" name="nbPayment" type="number" min="0" max="24"
                                       class="form-control input-md" value="{$btn['nbPayment'|escape:'html':'UTF-8']}">
                                <span class="help-block" id="spanNbPayment">{l s='Defines the payment duration in months' mod='paygreen'}</span>
                            </div>
                        </div>

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label"
                                   for="displayType" id ="labelReport">{l s='Payment deferment' mod='paygreen'}</label>
                            <div class="col-md-7">
                                <select id="reportPayment" name="reportPayment" class="form-control">
                                    <option value="0"{if $btn['reportPayment'] == '0'} selected="selected"{/if}>{l s='No deferment' mod='paygreen'}</option>
                                    <option value="1 week"{if $btn['reportPayment'] == '1 week'} selected="selected"{/if}>{l s='1 week' mod='paygreen'}</option>
                                    <option value="2 weeks"{if $btn['reportPayment'] == '2 weeks'} selected="selected"{/if}>{l s='2 weeks' mod='paygreen'}</option>
                                    <option value="1 month"{if $btn['reportPayment'] == '1 month'} selected="selected"{/if}>{l s='1 month' mod='paygreen'}</option>
                                    <option value="2 months"{if $btn['reportPayment'] == '2 months'} selected="selected"{/if}>{l s='2 months' mod='paygreen'}</option>
                                    <option value="3 months"{if $btn['reportPayment'] == '3 months'} selected="selected"{/if}>{l s='3 months' mod='paygreen'}</option>
                                </select>
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label"
                                   for="nbPayment">{l s='Amount cart' mod='paygreen'}</label>
                            <div class="col-xs-5 col-md-3">
                                <input id="minAmount" name="minAmount" min="0" type="number" placeholder=""
                                       class="form-control input-md"
                                       value="{if $btn['minAmount']>0}{$btn['minAmount'|escape:'html':'UTF-8']}{/if}">
                                <span class="help-block">{l s='Minimum' mod='paygreen'}</span>
                            </div>
                            <div class="col-xs-2 col-md-1 text-center">{l s='to' mod='paygreen'}</div>
                            <div class="col-xs-5 col-md-3">
                                <input id="maxAmount" name="maxAmount" min="0" type="number" placeholder=""
                                       class="form-control input-md"
                                       value="{if $btn['maxAmount']>0}{$btn['maxAmount'|escape:'html':'UTF-8']}{/if}">
                                <span class="help-block">{l s='Maximum' mod='paygreen'}</span>
                            </div>
                        </div>

                        <!-- Button (Double) -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="resetBtn"></label>
                            <div class="col-md-8">
                                {if $btn['id'] > 0}
                                    <button id="resetBtn" name="submitPaygreenModuleButtonDelete"
                                            class="btn btn-danger">{l s='Delete' mod='paygreen'}</button>
                                {else}
                                    <button id="resetBtn" name="resetBtn" type="reset"
                                            class="btn btn-danger">{l s='Cancel' mod='paygreen'}</button>
                                {/if}
                                <button type="submit" id="validBtn" name="submitPaygreenModuleButton"
                                        class="btn btn-success">{l s='Validate' mod='paygreen'}</button>
                            </div>
                        </div>

                    </fieldset>
                </form>
            </div>
            <!-- alignement of cols -->
            {if $key%2==0 && $key>1}
                <div class="clearfix visible-lg-block"></div>
            {/if}
            {if $key%2==1 && $key>1}
                <div class="clearfix visible-md-block"></div>
            {/if}
        {/foreach}
    </div>
</div>
