# encoding: utf-8
Feature: 广告位管理
	为了管理广告位点击
	作为一个管理者
	我需要查看广告位信息

 	Scenario: Clicks List
 		Given I am logged in
 		And I should see "流量"
 		When I follow "流量"
 		And I should see "点击量分类列表"
