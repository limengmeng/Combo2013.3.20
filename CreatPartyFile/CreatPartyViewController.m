//
//  CreatPartyViewController.m
//  party
//
//  Created by yilinlin on 13-1-19.
//
//

#import "CreatPartyViewController.h"

#import "MapViewController.h"

#import "InvitViewController.h"
#import "SDImageView+SDWebCache.h"
@interface CreatPartyViewController ()

@end

@implementation CreatPartyViewController
@synthesize sinaArr;
@synthesize friengArr;
@synthesize lat,lng;
@synthesize map_city,map_local;

@synthesize P_info,P_time,P_title,P_local;
@synthesize from_C_id,from_C_title,from_P_type;

@synthesize activityName,activityPlace,activityTime;
@synthesize introduce,creat;
@synthesize DatePicker,time,keyboardToolbar;
-(void)viewWillAppear:(BOOL)animated
{
    [self hideTabBar:YES];
    self.navigationItem.hidesBackButton=YES;
    UIButton* backbutton=[UIButton  buttonWithType:UIButtonTypeCustom];
    backbutton.frame=CGRectMake(0.0, 0.0, 36, 29);
    [backbutton setImage:[UIImage imageNamed:@"POBack@2x.png"] forState:UIControlStateNormal];
    [backbutton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchDown];
    
    UIBarButtonItem* goback=[[UIBarButtonItem alloc]initWithCustomView:backbutton];
    self.navigationItem.leftBarButtonItem=goback;
    
    [super viewWillAppear:animated];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [self hideTabBar:NO];
    [super viewWillDisappear:animated];
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    
    
    NSLog(@"friengArr=======%@",friengArr);
    NSLog(@"sinaArr=======%@",sinaArr);

    [super viewDidLoad];
    self.view.backgroundColor=[UIColor colorWithRed:250.0/255 green:250.0/255 blue:250.0/255 alpha:1];
    
   // friengArr =[[NSMutableArray alloc] initWithCapacity:10];
	// Do any additional setup after loading the view, typically from a nib.
    
    P_info=[[NSString alloc]init];
//    P_title=[[NSString alloc]init];
//    P_time=[[NSString alloc]init];
    P_local=[[NSString alloc]init];
    
    //*******************************活动名称********************************
    //活动名称
    UITextField *field1=[[UITextField alloc]initWithFrame:CGRectMake(10, 10, 300, 40)];
    field1.borderStyle=UITextBorderStyleBezel;
    field1.userInteractionEnabled=NO;
    field1.backgroundColor=[UIColor clearColor];
    field1.background = [UIImage imageNamed:@"makeview1@2x.png"];
    [self.view addSubview:field1];
    
    //textFiled
    activityName=[[UITextField alloc]initWithFrame:CGRectMake(100, 10, 240, 40)];
    [activityName setFont:[UIFont fontWithName:@"Arial" size:12.0]];
    activityName.textColor=[UIColor colorWithRed:99.0/255 green:99.0/255 blue:99.0/255 alpha:1];
    activityName.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    activityName.backgroundColor=[UIColor clearColor];
    activityName.tag=100;
    activityName.text=self.P_title;
    activityName.font=[UIFont systemFontOfSize:14];
    activityName.delegate=self;

//    NSLog(@"%@",self.from_C_title);
//    if (![self.from_C_title isEqualToString:@"(null)"]) {
//        activityName.text=self.from_C_title;
//    }
    //P_title=self.from_C_title;
    [self.view addSubview:activityName];
    
    UILabel *labelName=[[UILabel alloc]initWithFrame:CGRectMake(20, 10, 80, 40)];
    labelName.text=@"活动名称：";
    labelName.textColor=[UIColor lightGrayColor];
    labelName.font=[UIFont systemFontOfSize:14];
    labelName.backgroundColor=[UIColor clearColor];
    [self.view addSubview:labelName];
    //*******************************活动名称********************************
    
    //*******************************活动地点********************************
    //活动地点
    UITextField *field2=[[UITextField alloc]initWithFrame:CGRectMake(10, 49, 300, 40)];
    field2.borderStyle=UITextBorderStyleBezel;
    field2.userInteractionEnabled=NO;
    field2.backgroundColor=[UIColor clearColor];
    field2.background = [UIImage imageNamed:@"makeview1@2x.png"];
    [self.view addSubview:field2];
    
    activityPlace=[[UITextField alloc]initWithFrame:CGRectMake(100, 49, 240, 40)];
    activityPlace.backgroundColor=[UIColor clearColor];
    activityPlace.textColor=[UIColor colorWithRed:99.0/255 green:99.0/255 blue:99.0/255 alpha:1];
    activityPlace.font=[UIFont systemFontOfSize:14];
    activityPlace.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    activityPlace.tag=101;
    activityPlace.text=[NSString stringWithFormat:@"%@%@",self.map_city,self.map_local];
    activityPlace.userInteractionEnabled=NO;
    activityPlace.delegate=self;
    [self.view addSubview:activityPlace];
    
    UILabel *labelPlace=[[UILabel alloc]initWithFrame:CGRectMake(20, 49, 80, 40)];
    labelPlace.text=@"活动地点：";
    labelPlace.textColor=[UIColor lightGrayColor];
    labelPlace.font=[UIFont systemFontOfSize:14];
    labelPlace.backgroundColor=[UIColor clearColor];
    [self.view addSubview:labelPlace];
    
    UIButton *button1 =[UIButton buttonWithType:UIButtonTypeCustom];
    button1.frame=CGRectMake(70, 49, 240, 40);
    button1.backgroundColor=[UIColor clearColor];
    [self.view addSubview:button1];
    [button1 addTarget:self action:@selector(mapAction) forControlEvents:UIControlEventTouchUpInside];

    //*******************************活动地点 end********************************
    
    //*******************************活动时间*******************************
    UITextField *field3=[[UITextField alloc]initWithFrame:CGRectMake(10, 88, 300, 40)];
    field3.borderStyle=UITextBorderStyleBezel;
    field3.userInteractionEnabled=NO;
    field3.backgroundColor=[UIColor clearColor];
    field3.background = [UIImage imageNamed:@"makeview1@2x.png"];
    [self.view addSubview:field3];
    
    activityTime=[[UITextField alloc]initWithFrame:CGRectMake(100, 88, 240, 40)];
    activityTime.backgroundColor=[UIColor clearColor];
    [activityTime setFont:[UIFont fontWithName:@"Arial" size:12.0]];
    activityTime.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    activityTime.tag=102;
    activityTime.text=self.P_time;
    activityTime.font=[UIFont systemFontOfSize:14];
    activityTime.textColor=[UIColor colorWithRed:99.0/255 green:99.0/255 blue:99.0/255 alpha:1];
    activityTime.delegate=self;
    [self.view addSubview:activityTime];
    
    UILabel *labelTime=[[UILabel alloc]initWithFrame:CGRectMake(20, 88, 80, 40)];
    labelTime.text=@"活动时间：";
    labelTime.textColor=[UIColor lightGrayColor];
    labelTime.font=[UIFont systemFontOfSize:14];
    labelTime.backgroundColor=[UIColor clearColor];
    [self.view addSubview:labelTime];
    //*******************************活动时间 end*******************************
    
    //********************************联合创建人*****************************
    UITextField *field4=[[UITextField alloc]initWithFrame:CGRectMake(10, 142, 300, 40)];
    field4.borderStyle=UITextBorderStyleBezel;
    field4.userInteractionEnabled=NO;
    field4.backgroundColor=[UIColor clearColor];
    field4.background = [UIImage imageNamed:@"MakeView2@2x.png"];
    [self.view addSubview:field4];
    
    creat=[[UITextField alloc]initWithFrame:CGRectMake(90, 142, 220, 40)];
    creat.backgroundColor=[UIColor whiteColor];
    creat.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    creat.placeholder=@"最多可以选择4名好友与你共同创建";
    creat.font=[UIFont systemFontOfSize:12];
    creat.tag=103;
    [self creatFriend];
    //creat.backgroundColor=[UIColor clearColor];
    creat.enabled=NO;
    creat.delegate=self;
    creat.backgroundColor = [UIColor clearColor];//这句话生效了
    //creat.background = [UIImage imageNamed:@"MakeView2@2x.png"];
    [self.view addSubview:creat];
    UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake(10, 142, 300, 40)];
    button.backgroundColor=[UIColor clearColor];
    [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    UILabel *labelCreat=[[UILabel alloc]initWithFrame:CGRectMake(20, 142, 80, 40)];
    labelCreat.text=@"联合创建：";
    labelCreat.textColor=[UIColor lightGrayColor];
    labelCreat.font=[UIFont systemFontOfSize:14];
    labelCreat.backgroundColor=[UIColor clearColor];
    [self.view addSubview:labelCreat];

    //********************************联合创建人end*****************************
    
    //*******************************活动简介 end*******************************
    textField1=[[UITextField alloc]initWithFrame:CGRectMake(10, 192, 300, 100)];
    textField1.backgroundColor=[UIColor whiteColor];
    textField1.font=[UIFont systemFontOfSize:14];
    textField1.backgroundColor=[UIColor clearColor];
    textField1.placeholder=@" 输入你们的活动介绍";
    textField1.borderStyle=UITextBorderStyleBezel;
    textField1.delegate=self;
    textField1.background = [UIImage imageNamed:@"MakeView3@2x.png"];
    textField1.userInteractionEnabled=NO;
    [self.view addSubview:textField1];
    
    //*******************************活动简介*******************************
    introduce=[[UITextView alloc]initWithFrame:CGRectMake(10, 192, 300, 100)];
    introduce.backgroundColor=[UIColor whiteColor];
    introduce.font=[UIFont systemFontOfSize:14];
    introduce.tag=104;
    introduce.delegate=self;
    introduce.backgroundColor = [UIColor clearColor];//这句话生效了
    [self.view addSubview:introduce];
    
    //*******************************创建按钮*******************************
    //按钮操作
    btn =[[UIButton alloc]initWithFrame:CGRectMake(30, 320, (self.view.frame.size.width-60), 40)];
    [btn addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor=[UIColor clearColor];
    [btn setBackgroundImage:[UIImage imageNamed:@"chuangjian@2x.png"] forState:UIControlStateNormal];
    
    [self.view addSubview:btn];

    //*******************************创建按钮 end*******************************
    
    //*******************************时间选择器*******************************
    //datePicker
    // Birthday date picker
    if (self.DatePicker==nil) {
       datePicker = [[UIDatePicker alloc] init];
        
        [datePicker setLocale: [[NSLocale alloc] initWithLocaleIdentifier: @"zh_CN"]];//设置时间选择器语言环境为中文

        [self.DatePicker addTarget:self action:@selector(DatePickerChanged:) forControlEvents:UIControlEventValueChanged];
        self.DatePicker.datePickerMode = UIDatePickerModeDateAndTime;
        self.DatePicker.minimumDate = [NSDate date];
        self.DatePicker.minuteInterval = 10;
    }
    
    
    // Keyboard toolbar
    if (self.keyboardToolbar == nil) {
        keyboardToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 38.0f)];
        self.keyboardToolbar.barStyle = UIBarStyleBlackTranslucent;
        
        UIBarButtonItem *spaceBarItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                                      target:nil
                                                                                      action:nil];
        
        UIBarButtonItem *doneBarItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"确定", @"")
                                                                        style:UIBarButtonItemStyleDone
                                                                       target:self
                                                                       action:@selector(resignKeyboard:)];
        
        [self.keyboardToolbar setItems:[NSArray arrayWithObjects:spaceBarItem, doneBarItem, nil]];
        
        self.activityTime.inputAccessoryView = self.keyboardToolbar;
        self.activityTime.inputView = self.DatePicker;
        
        //*******************************时间选择器 end*******************************
    }
    
    //*******************************隐藏键盘*******************************
    //点击空白区域隐藏键盘
    UITapGestureRecognizer *tapGr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)];
    tapGr.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tapGr];
    //*******************************隐藏键盘 end*******************************
}

-(void)creatFriend{
    for (int i=0; i<[friengArr count]; i++) {
        UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0+40*i, 2, 35, 35)];
        NSURL* imageurl=[NSURL URLWithString:[[friengArr objectAtIndex:i] objectForKey:@"USER_PIC"]];
        [imageView setImageWithURL:imageurl];
        [self.creat addSubview:imageView];
    }
    for (int i=0; i<[sinaArr count]; i++) {
        UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0+40*(i+[friengArr count]), 2, 35, 35)];
        NSURL* imageurl=[NSURL URLWithString:[[sinaArr objectAtIndex:i] objectForKey:@"avatar_large"]];
        [imageView setImageWithURL:imageurl];
        [self.creat addSubview:imageView];
    }
    
    if ([friengArr count]!=0||[sinaArr count]!=0) {
        creat.placeholder=@"";
    }
}

//*******************************邀请函操作*******************************
-(void)buttonAction{
    [introduce endEditing:YES];
    P_info=introduce.text;
    if (self.P_info==nil||self.P_title==nil||self.P_time==nil) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"提示" message:@"请填写完整信息" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
        [alert show];
    }
    else
        [self sendData];
}

-(void)sendData{
    NSLog(@"self.friengArr==%@",friengArr);
    NSLog(@"P_info=%@",P_info);
    InvitViewController *inviController=[[InvitViewController alloc]init];
    inviController.temp=1;
    inviController.title=@"邀请函";
    
    //*****************************传输数据**********************************

    inviController.stitle=P_title;
    inviController.time=self.time;
    inviController.info=P_info;
    inviController.friendId=friengArr;
    inviController.sinaArray=sinaArr;
    inviController.from_Creat_p_type=self.from_P_type;
    inviController.from_Creat_C_id=self.from_C_id;
    inviController.lng=self.lng;
    inviController.lat=self.lat;
    inviController.map_city=self.map_city;
    inviController.map_local=self.map_local;
    
    NSLog(@"传值。。。。。====%@",self.time);

    
    NSLog(@"self.lat==%f",self.lat);
    NSLog(@"self.lng==%f",self.lng);
    
    //*****************************传输数据 end**********************************
    
    [self.navigationController pushViewController:inviController animated:YES];
    //[self.friengArr removeAllObjects];
}
//*******************************邀请函操作 end*******************************

//********************************联合创建人方法*****************************
-(void)buttonActive{
    
    [self.navigationController popViewControllerAnimated:YES];
    
//    CheckOneViewController *friend=[[CheckOneViewController alloc]init];
//    friend.delegateFriend=self;
//    friend.title=@"邀请好友";
//    friend.spot=1;
//    friend.from_p_id=0;
//    [self.navigationController pushViewController:friend animated:YES];
//    [friend release];
}
//********************************联合创建人方法 end*****************************

//*******************************隐藏键盘操作*******************************
-(void)viewTapped:(UITapGestureRecognizer*)tapGr{
    [activityName resignFirstResponder];
    //[activityPlace resignFirstResponder];
    [activityTime resignFirstResponder];
    //[creat resignFirstResponder];
    [introduce resignFirstResponder];
}
//*******************************隐藏键盘操作 end*******************************

//*******************************返回上一级*******************************
-(void)leftAction{
    NSLog(@"Guojiangwei");
    [self.navigationController popViewControllerAnimated:YES];
}
//*******************************返回上一级 end*******************************

#pragma mark - Others

- (void)resignKeyboard:(id)sender
{
    self.time = self.DatePicker.date;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy年MM月dd日HH点mm分"];
    self.activityTime.text  =[formatter stringFromDate:self.time];
    
    id firstResponder = self.activityTime;
    [firstResponder resignFirstResponder];
}

//*******************************视图上移*******************************
- (void)animateView:(NSInteger)tag;
{
    CGRect rect = self.view.frame;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    if(tag==104)
        rect.origin.y = -140.0f;
    else
        rect.origin.y=0;
    self.view.frame = rect;
    [UIView commitAnimations];
}
//*******************************视图上移 end*******************************

//*******************************选择时间*******************************
- (void)DatePickerChanged:(id)sender
{
    self.time = self.DatePicker.date;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy年MM月dd日HH点mm分"];
    self.activityTime.text  =[formatter stringFromDate:self.time];
}
//*******************************选择时间 end*******************************
#pragma mark - UITextFieldDelegate

-(void)textViewDidBeginEditing:(UITextView *)textView{
    textField1.placeholder=@"";
    [self animateView:104];
}

-(void)mapAction{
    MapViewController *creatCtr=[[MapViewController alloc]init];
    //[self.tabBarController.view addSubview:creatCtr.view];

    creatCtr.delegate=self;
    creatCtr.map_Temp=2;
    [self.navigationController pushViewController:creatCtr animated:YES];
}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}

-(void)textViewDidEndEditing:(UITextView *)textView{
//    P_info=introduce.text;
//    NSLog(@"introduce.text=====%@",introduce.text);
    [self animateView:105];
}
//*******************************textField完成编辑*******************************
-(void)textFieldDidEndEditing:(UITextField *)textField{
    NSMutableString *string=[[NSMutableString alloc]init];
    //[string appendFormat:@"%@",self.from_C_title];
    [string appendFormat:@"%@",activityName.text];
    P_title=string;
    //[string release];
    P_local=activityPlace.text;
    P_time=self.activityTime.text;
    
    if (textField.tag==100) {
        P_title=textField.text;
        NSLog(@"%@",P_title);
    }else if (textField.tag==101)
        P_local=textField.text;
    
    else if(textField.tag=102)
        P_time=textField.text;
    NSLog(@"P_title=%@",P_title);
    NSLog(@"P_local=%@",P_local);
    NSLog(@"P_time=%@",P_time);
}

//*******************************textField完成编辑 end*******************************

//*******************************选择联合创建人后返回数据*******************************
-(void)CallBack:(NSMutableArray *)muArr
{
    [friengArr removeAllObjects];
    [friengArr addObjectsFromArray:muArr];
    NSLog(@"%d",friengArr.count);
    for (UIView *views in self.creat.subviews)
    {
        [views removeFromSuperview];
    }
    for (int i=0; i<[friengArr count]; i++) {
        UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0+40*i, 2, 35, 35)];
        NSURL* imageurl=[NSURL URLWithString:[[friengArr objectAtIndex:i] objectForKey:@"USER_PIC"]];
        [imageView setImageWithURL:imageurl];
        [self.creat addSubview:imageView];
    }
    
    if ([friengArr count]!=0) {
        creat.placeholder=@"";
    }
}
//*******************************选择联合创建人后返回数据 end*******************************


//点击done隐藏键盘
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void) hideTabBar:(BOOL) hidden {
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0];
    
    for(UIView *view in self.tabBarController.view.subviews)
    {
        if([view isKindOfClass:[UITabBar class]])
        {
            if (hidden) {
                [view setFrame:CGRectMake(view.frame.origin.x, mainscreenhight, view.frame.size.width, view.frame.size.height)];
            } else {
                [view setFrame:CGRectMake(view.frame.origin.x, (mainscreenhight-36), view.frame.size.width, view.frame.size.height)];
            }
        }
        else
        {
            if (hidden) {
                [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, mainscreenhight)];
            } else {
                [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width,mainscreenhight-36)];//(mainscreenhight-49)*mainscreenhight/460.0)
            }
        }
    }
    
    [UIView commitAnimations];
}


-(void)passCity:(NSString *)city andLocal:(NSString *)local
{
    self.map_city=city;
    self.map_local=local;
    activityPlace.text=[NSString stringWithFormat:@"%@ %@",self.map_city,self.map_local];
    NSLog(@"%@:::%@",self.map_city,self.map_local);
    NSLog(@"%f:::%f",lat,lng);

}

-(void)passLat:(float)_lat andLng:(float)_lng
{
    self.lat=_lat;
    self.lng=_lng;
    NSLog(@"%@:::%@",self.map_city,self.map_local);
    NSLog(@"%f:::%f",lat,lng);  
}



-(void)back
{
    
    [self.navigationController popViewControllerAnimated:YES];
}

@end
