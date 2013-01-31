package game.skin
{
	import VIP2.mingchengditu;mingchengditu;
	import VIP2.neidiban;neidiban;
	import VIP2.beijingtu;beijingtu;
	import VIP2.yuanbao;yuanbao;
	import VIP2.gezibeijing;gezibeijing;
	import VIP2.itembeijing;itembeijing;
	import VIP2.red;red;
	import VIP2.chengweivip;chengweivip;
	import VIP2.huanganniu;huanganniu;
	import VIP2.linqujiangli;linqujiangli;
	import VIP2.VIP;VIP;
	import VIP2.tequanditu;tequanditu;
	import VIP2.listbeijing;listbeijing;
	import VIP2.listbeijing2;listbeijing2;
	import VIP2.xian;xian;
	import VIP2.track;track;
	import VIP2.thumb;thumb;
	import VIP2.xiangxia;xiangxia;
	import VIP2.xiangshang;xiangshang;

	public class VIP2Skin
	{
		public static var skin:Object=
			{name:"VIP2",type:"Container",x:0,y:0,width:597,height:589,
				children:
				[
					{name:"开服活动",type:"Label",x:266,y:26,width:68,height:21,
						normal:{x:0,y:0,width:68,height:21,content:"<font color='#feefab'><b>开服活动</b></font>",format:{align:"left",bold:true,color:0xfeefab,font:"SimHei",italic:false,leading:16,letterSpacing:0,size:16,underline:false}}
					},
					{name:"mingchengditu",type:"Image",x:160,y:0,width:278,height:64,
						normal:{link:"VIP2.mingchengditu",x:0,y:0,width:278,height:64}
					},
					{name:"my右",type:"Container",x:1048576,y:1048576,width:-1048576,height:-1048576,
						children:
						[

						]
					},
					{name:"xiabu",type:"Container",x:45,y:229,width:507,height:360,
						children:
						[
							{name:"tequanliebiao",type:"List",x:10,y:40,width:456,height:17,
								item:
									{name:"myItem",type:"Container",x:0,y:0,width:456,height:17,
									children:
									[
										{name:"佛挡杀佛对方是否给发货速度国大使馆股份√10%20%",type:"Label",x:0,y:0,width:456,height:17,
											normal:{x:0,y:0,width:456,height:17,content:"<font color='#ecd18b'>佛挡杀佛对方是否给发货速度国大使馆股份         </font><font color='#01f5ff'>√</font><font color='#ecd18b'>      </font><font color='#ffffff'>10%</font><font color='#ecd18b'>     </font><font color='#ffff00'>20%</font>",format:{align:"left",bold:false,color:0xecd18b,font:"SimSun",italic:false,leading:21,letterSpacing:1.2,size:12,underline:false}}
										}
									]
								},
								children:
								[

								]
							},
							{name:"tequan",type:"ScrollBar",x:486,y:2,width:21,height:227,
								children:
								[
									{name:"arrowUp",type:"Button",x:0,y:0,width:21,height:22,
										children:
										[
											{name:"myImage",type:"Image",x:0,y:0,width:21,height:22,
												normal:{link:"VIP2.xiangshang",x:0,y:0,width:21,height:22}
											}
										]
									},
									{name:"arrowDown",type:"Button",x:0,y:205,width:21,height:22,
										children:
										[
											{name:"myImage",type:"Image",x:0,y:0,width:21,height:22,
												normal:{link:"VIP2.xiangxia",x:0,y:0,width:21,height:22}
											}
										]
									},
									{name:"thumb",type:"Button",x:0,y:67,width:21,height:38,
										children:
										[
											{name:"thumb",type:"ScaleImage",x:0,y:0,width:21,height:38,top:6,right:6,bottom:6,left:6,
												normal:{link:"VIP2.thumb",x:0,y:0,width:21,height:38}
											}
										]
									},
									{name:"track",type:"Container",x:3,y:6,width:13,height:215,
										children:
										[
											{name:"track",type:"Image",x:0,y:0,width:13,height:215,
												normal:{link:"VIP2.track",x:0,y:0,width:13,height:215}
											}
										]
									}
								]
							},
							{name:"xian2",type:"Image",x:422,y:5,width:1,height:27,
								normal:{link:"VIP2.xian",x:0,y:0,width:1,height:26}
							},
							{name:"xian1",type:"Image",x:362,y:5,width:1,height:27,
								normal:{link:"VIP2.xian",x:0,y:0,width:1,height:26}
							},
							{name:"xian0",type:"Image",x:301,y:5,width:1,height:27,
								normal:{link:"VIP2.xian",x:0,y:0,width:1,height:26}
							},
							{name:"VIPxiushi",type:"Label",x:305,y:9,width:178,height:17,
								normal:{x:0,y:0,width:178,height:17,content:"<font color='#01f6ff'><b>钻石VIP</b></font><font color='#ecd18b'> </font><font color='#ffffff'><b>白金VIP</b></font><font color='#ecd18b'> </font><font color='#ffff00'><b>黄金VIP</b></font>",format:{align:"left",bold:true,color:0x01f6ff,font:"SimSun",italic:false,leading:21,letterSpacing:1.2,size:12,underline:false}}
							},
							{name:"VIP",type:"Image",x:108,y:5,width:72,height:26,
								normal:{link:"VIP2.VIP",x:0,y:0,width:72,height:26}
							},
							{name:"tequanditu",type:"Image",x:0,y:3,width:489,height:33,
								normal:{link:"VIP2.tequanditu",x:0,y:0,width:489,height:33}
							},
							{name:"listbeijing",type:"Image",x:3,y:32,width:483,height:328,
								normal:{link:"VIP2.listbeijing",x:0,y:0,width:483,height:328}
							},
							{name:"listbeijing2",type:"Image",x:0,y:0,width:507,height:231,
								normal:{link:"VIP2.listbeijing2",x:0,y:0,width:507,height:231}
							}
						]
					},
					{name:"shangbu",type:"Container",x:51,y:75,width:496,height:151,
						children:
						[
							{name:"lingqujiangli",type:"Button",x:255,y:22,width:121,height:34,
								children:
								[
									{name:"linqujiangli",type:"Image",x:26,y:7,width:69,height:20,
										normal:{link:"VIP2.linqujiangli",x:0,y:0,width:69,height:20}
									},
									{name:"myImage",type:"Image",x:0,y:0,width:121,height:34,
										normal:{link:"VIP2.huanganniu",x:0,y:0,width:119,height:34}
									}
								]
							},
							{name:"chengweivip",type:"Button",x:375,y:22,width:121,height:34,
								children:
								[
									{name:"chengweivip",type:"Image",x:30,y:7,width:62,height:20,
										normal:{link:"VIP2.chengweivip",x:0,y:0,width:62,height:20}
									},
									{name:"myImage",type:"Image",x:0,y:0,width:121,height:34,
										normal:{link:"VIP2.huanganniu",x:0,y:0,width:119,height:34}
									}
								]
							},
							{name:"欢迎",type:"Label",x:0,y:0,width:487,height:45,
								normal:{x:0,y:0,width:487,height:45,content:"<font color='#ffff05'><b>欢迎您，您还不是VIP玩家：</b></font><font color='#ecd18b'>[1]嘻嘻哈哈地方                  </font><font color='#ffff05'><b>今日飞行次数：</b></font><font color='#00ff00'>123次
</font><font color='#ffff05'><b>VIP剩余时间：</b></font><font color='#00ff00'>0天00:00:00</font>",format:{align:"left",bold:true,color:0xffff05,font:"SimSun",italic:false,leading:16,letterSpacing:0,size:12,underline:false}}
							},
							{name:"jiangpin",type:"List",x:5,y:57,width:147,height:94,
								item:
									{name:"myItem",type:"Container",x:0,y:0,width:147,height:94,
									children:
									[
										{name:"vip",type:"Button",x:23,y:65,width:98,height:29,
											children:
											[
												{name:"成为钻石VIP",type:"Label",x:14,y:6,width:70,height:17,
													normal:{x:0,y:0,width:70,height:17,content:"<font color='#f8e9a7'>成为钻石VIP</font>",format:{align:"left",bold:false,color:0xf8e9a7,font:"SimSun",italic:false,leading:9,letterSpacing:0,size:12,underline:false}}
												},
												{name:"myImage",type:"Image",x:0,y:0,width:98,height:29,
													normal:{link:"VIP2.red",x:0,y:0,width:98,height:29}
												}
											]
										},
										{name:"yuanbao",type:"Image",x:112,y:25,width:19,height:28,
											normal:{link:"VIP2.yuanbao",x:0,y:0,width:19,height:28}
										},
										{name:"原价",type:"Label",x:58,y:24,width:46,height:31,
											normal:{x:0,y:0,width:46,height:31,content:"<font color='#ecd18b'>原价：5
</font><font color='#fffffd'>现价：2</font>",format:{align:"left",bold:false,color:0xecd18b,font:"SimSun",italic:false,leading:2,letterSpacing:0,size:12,underline:false}}
										},
										{name:"永久生命药",type:"Label",x:58,y:7,width:69,height:17,
											normal:{x:0,y:0,width:69,height:17,content:"<font color='#f4ab01'><b>永久生命药</b></font>",format:{align:"left",bold:true,color:0xf4ab01,font:"SimSun",italic:false,leading:9,letterSpacing:0,size:12,underline:false}}
										},
										{name:"gezibeijing",type:"Image",x:7,y:7,width:48,height:48,
											normal:{link:"VIP2.gezibeijing",x:0,y:0,width:48,height:48}
										},
										{name:"itembeijing",type:"Image",x:0,y:0,width:147,height:66,
											normal:{link:"VIP2.itembeijing",x:0,y:0,width:147,height:66}
										}
									]
								},
								children:
								[

								]
							}
						]
					},
					{name:"neidiban",type:"Image",x:42,y:65,width:513,height:398,
						normal:{link:"VIP2.neidiban",x:0,y:0,width:513,height:398}
					},
					{name:"beijingtu",type:"Image",x:0,y:12,width:597,height:473,
						normal:{link:"VIP2.beijingtu",x:0,y:0,width:597,height:473}
					}
				]
			};
	}
}