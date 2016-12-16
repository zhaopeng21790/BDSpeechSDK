//
//  ViewController.m
//  BDSpeechSample
//
//  Created by 赵朋 on 2016/12/16.
//  Copyright © 2016年 Codi. All rights reserved.
//

#import "ViewController.h"
#import "BDSSpeechSynthesizer.h"
#import "BDSSpeechSynthesizerDelegate.h"

@interface ViewController ()<BDSSpeechSynthesizerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    [[BDSSpeechSynthesizer sharedInstance] setSynthesizerDelegate: self];
    [[BDSSpeechSynthesizer sharedInstance] setApiKey:@"diOkUsNGD8F2iGnhlejzXoZ8" withSecretKey:@"76be1ebd34c9e2a1f4c71be48c52a665"];
    
    [[BDSSpeechSynthesizer sharedInstance] setSynthParam:[NSNumber numberWithFloat:10.0] forKey:BDS_SYNTHESIZER_PARAM_ONLINE_REQUEST_TIMEOUT];
    
    
    [[BDSSpeechSynthesizer sharedInstance] speakSentence:@"你好，我在呢。" withError:nil];
    
    
}


//开始合成句子
- (void)synthesizerStartWorkingSentence:(NSInteger)SynthesizeSentence {
    NSLog(@"synthesizerStartWorkingSentence");
}


//合成结束
- (void)synthesizerFinishWorkingSentence:(NSInteger)SynthesizeSentence {
    NSLog(@"synthesizerFinishWorkingSentence");
}

//开始朗读句子
- (void)synthesizerSpeechStartSentence:(NSInteger)SpeakSentence {
    NSLog(@"synthesizerSpeechStartSentence");
}

//朗读结束
- (void)synthesizerSpeechEndSentence:(NSInteger)SpeakSentence {
    NSLog(@"synthesizerSpeechEndSentence");
}


//新的语音数据已经合成
- (void)synthesizerNewDataArrived:(NSData *)newData
                       DataFormat:(BDSAudioFormat)fmt
                   characterCount:(int)newLength
                   sentenceNumber:(NSInteger)SynthesizeSentence {
    NSLog(@"asdfasdfasdfdfs %ld", (long)SynthesizeSentence);
}


//暂停
- (void)synthesizerdidPause {
    NSLog(@"synthesizerdidPause");
}

//恢复
- (void)synthesizerResumed {
    NSLog(@"synthesizerResumed");
}



//合成错误
- (void)synthesizerErrorOccurred:(NSError *)error
                        speaking:(NSInteger)SpeakSentence
                    synthesizing:(NSInteger)SynthesizeSentence {
    
    NSLog(@"error --> %@", error);
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
