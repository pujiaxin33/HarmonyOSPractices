import http from '@ohos.net.http';
import common from '@ohos.app.ability.common';
import util from '@ohos.util';

export class MockApiClient {
  static startRequest(urlPath: string, method: http.RequestMethod) {
    let jsonString: string = ""
    switch (urlPath) {
      case '/tweets.json':
        jsonString = `[
  {
    "content": "沙发！",
    "images": [
      {
        "url": "https://xianmobilelab.gitlab.io/moments-data/images/tweets/001.jpeg"
      },
      {
        "url": "https://xianmobilelab.gitlab.io/moments-data/images/tweets/002.jpeg"
      },
      {
        "url": "https://xianmobilelab.gitlab.io/moments-data/images/tweets/003.jpeg"
      }
    ],
    "sender": {
      "username": "cyao",
      "nick": "Cheng Yao",
      "avatar": "https://xianmobilelab.gitlab.io/moments-data/images/user/avatar/001.jpeg"
    },
    "comments": [
      {
        "content": "Good.",
        "sender": {
          "username": "leihuang",
          "nick": "Lei Huang",
          "avatar": "https://xianmobilelab.gitlab.io/moments-data/images/user/avatar/002.jpeg"
        }
      },
      {
        "content": "Like it too",
        "sender": {
          "username": "weidong",
          "nick": "WeiDong Gu",
          "avatar": "https://xianmobilelab.gitlab.io/moments-data/images/user/avatar/003.jpeg"
        }
      }
    ]
  },
  {
    "sender": {
      "username": "xinge",
      "nick": "Xin Ge",
      "avatar": "https://xianmobilelab.gitlab.io/moments-data/images/user/avatar/000.jpeg"
    }
  },
  {
    "images": [
      {
        "url": "https://xianmobilelab.gitlab.io/moments-data/images/tweets/004.jpeg"
      }
    ],
    "sender": {
      "username": "yangluo",
      "nick": "Yang Luo",
      "avatar": "https://xianmobilelab.gitlab.io/moments-data/images/user/avatar/004.jpeg"
    }
  },
  {
    "images": [
      {
        "url": "https://xianmobilelab.gitlab.io/moments-data/images/tweets/005.jpeg"
      }
    ],
    "sender": {
      "username": "jianing",
      "nick": "Jianing Zheng",
      "avatar": "https://xianmobilelab.gitlab.io/moments-data/images/user/avatar/005.jpeg"
    }
  },
  {
    "error": "losted"
  },
  {
    "content": "Unlike many proprietary big data processing platform different, Spark is built on a unified abstract RDD, making it possible to deal with different ways consistent with large data processing scenarios, including MapReduce, Streaming, SQL, Machine Learning and Graph so on. To understand the Spark, you have to understand the RDD. ",
    "images": [
      {
        "url": "https://xianmobilelab.gitlab.io/moments-data/images/tweets/006.jpeg"
      }
    ],
    "sender": {
      "username": "weifan",
      "nick": "Wei Fan",
      "avatar": "https://xianmobilelab.gitlab.io/moments-data/images/user/avatar/006.jpeg"
    }
  },
  {
    "content": "这是第二页第一条",
    "images": [
      {
        "url": "https://xianmobilelab.gitlab.io/moments-data/images/tweets/007.jpeg"
      },
      {
        "url": "https://xianmobilelab.gitlab.io/moments-data/images/tweets/008.jpeg"
      },
      {
        "url": "https://xianmobilelab.gitlab.io/moments-data/images/tweets/009.jpeg"
      },
      {
        "url": "https://xianmobilelab.gitlab.io/moments-data/images/tweets/010.jpeg"
      }
    ],
    "sender": {
      "username": "xinguo",
      "nick": "Xin Guo",
      "avatar": "https://xianmobilelab.gitlab.io/moments-data/images/user/avatar/007.jpeg"
    },
    "comments": [
      {
        "content": "Good.",
        "sender": {
          "username": "yanzili",
          "nick": "Yanzi Li",
          "avatar": "https://xianmobilelab.gitlab.io/moments-data/images/user/avatar/008.jpeg"
        }
      },
      {
        "content": "Like it too",
        "sender": {
          "username": "jingzhao",
          "nick": "Jing Zhao",
          "avatar": "https://xianmobilelab.gitlab.io/moments-data/images/user/avatar/001.jpeg"
        }
      }
    ]
  },
  {
    "sender": {
      "username": "hengzeng",
      "nick": "Niang Niang",
      "avatar": "https://xianmobilelab.gitlab.io/moments-data/images/user/avatar/000.jpeg"
    }
  },
  {
    "images": [
      {
        "url": "https://xianmobilelab.gitlab.io/moments-data/images/tweets/011.jpeg"
      }
    ],
    "sender": {
      "username": "jizhang",
      "nick": "Jian Zhang",
      "avatar": "https://xianmobilelab.gitlab.io/moments-data/images/user/avatar/002.jpeg"
    }
  },
  {
    "images": [
      {
        "url": "https://xianmobilelab.gitlab.io/moments-data/images/tweets/012.jpeg"
      }
    ],
    "sender": {
      "username": "yanzi",
      "nick": "Yanzi Li",
      "avatar": "https://xianmobilelab.gitlab.io/moments-data/images/user/avatar/003.jpeg"
    }
  },
  {
    "error": "illegal"
  },
  {
    "error": "WTF"
  },
  {
    "error": "WOW"
  },
  {
    "content": "As a programmer, we should as far as possible away from the Windows system. However, the most a professional programmer, and very difficult to bypass Windows this wretched existence but in fact very real, then how to quickly build a simple set of available windows based test environment? See Qiu Juntao's blog. ",
    "images": [
      {
        "url": "https://xianmobilelab.gitlab.io/moments-data/images/tweets/013.jpeg"
      }
    ],
    "sender": {
      "username": "jianing",
      "nick": "Jianing Zheng",
      "avatar": "https://xianmobilelab.gitlab.io/moments-data/images/user/avatar/004.jpeg"
    },
    "comments": [
      {
        "content": "Good.",
        "sender": {
          "username": "cyao",
          "nick": "Cheng Yao",
          "avatar": "https://xianmobilelab.gitlab.io/moments-data/images/user/avatar/005.jpeg"
        }
      }
    ]
  },
  {
    "content": "第9条！",
    "images": [
      {
        "url": "https://xianmobilelab.gitlab.io/moments-data/images/tweets/014.jpeg"
      },
      {
        "url": "https://xianmobilelab.gitlab.io/moments-data/images/tweets/015.jpeg"
      },
      {
        "url": "https://xianmobilelab.gitlab.io/moments-data/images/tweets/016.jpeg"
      },
      {
        "url": "https://xianmobilelab.gitlab.io/moments-data/images/tweets/016.jpeg"
      },
      {
        "url": "https://xianmobilelab.gitlab.io/moments-data/images/tweets/017.jpeg"
      },
      {
        "url": "https://xianmobilelab.gitlab.io/moments-data/images/tweets/018.jpeg"
      },
      {
        "url": "https://xianmobilelab.gitlab.io/moments-data/images/tweets/019.jpeg"
      },
      {
        "url": "https://xianmobilelab.gitlab.io/moments-data/images/tweets/020.jpeg"
      },
      {
        "url": "https://xianmobilelab.gitlab.io/moments-data/images/tweets/021.jpeg"
      }
    ],
    "sender": {
      "username": "jianing",
      "nick": "Jianing Zheng",
      "avatar": "https://xianmobilelab.gitlab.io/moments-data/images/user/avatar/006.jpeg"
    },
    "comments": []
  },
  {
    "content": "第10条！",
    "sender": {
      "username": "xinguo",
      "nick": "Xin Guo",
      "avatar": "https://xianmobilelab.gitlab.io/moments-data/images/user/avatar/007.jpeg"
    },
    "comments": []
  },
  {
    "content": "楼下保持队形，第11条",
    "sender": {
      "username": "yanzi",
      "nick": "Yanzi Li",
      "avatar": "https://xianmobilelab.gitlab.io/moments-data/images/user/avatar/008.jpeg"
    }
  },
  {
    "content": "第12条",
    "sender": {
      "username": "xinguo",
      "nick": "Xin Guo",
      "avatar": "https://xianmobilelab.gitlab.io/moments-data/images/user/avatar/001.jpeg"
    }
  },
  {
    "content": "第13条",
    "sender": {
      "username": "yanzili",
      "nick": "Yanzi Li",
      "avatar": "https://xianmobilelab.gitlab.io/moments-data/images/user/avatar/002.jpeg"
    }
  },
  {
    "content": "第14条",
    "sender": {
      "username": "xinguo",
      "nick": "Xin Guo",
      "avatar": "https://xianmobilelab.gitlab.io/moments-data/images/user/avatar/003.jpeg"
    }
  }
  {
    "unknown error": "STARCRAFT2"
  },
  {
    "content": "- The data json will be hosted in https://xianmobilelab.gitlab.io/moments-data/ - Nibs or storyboards are prohibited- Implement cache mechanism by you own if needed- Unit tests is appreciated.- Functional programming is appreciated- Deployment Target should be 7.0- Utilise Git for source control, for git log is the directly evidence of the development process- Utilise GCD for multi-thread operation- Only binary, framework or cocopods dependency is allowed. do not copy other developer's source code(*.h, *.m) into your project- Keep your code clean as much as possible",
    "sender": {
      "username": "hengzeng",
      "nick": "Huan Huan",
      "avatar": "https://xianmobilelab.gitlab.io/moments-data/images/user/avatar/004.jpeg"
    }
  }
]`
      break
      case '/user.json':
        jsonString = `{
        "profileImage": "https://xianmobilelab.gitlab.io/moments-data/images/user/profile-image.jpeg",
        "avatar": "https://xianmobilelab.gitlab.io/moments-data/images/user/avatar.png",
        "nick": "Huan Huan",
        "username": "hengzeng"
        }`
      break
    }

    return new Promise<http.HttpResponse>((resolve, reject) => {
      let response: http.HttpResponse = {
        result: jsonString,
        resultType: http.HttpDataType.STRING,
        responseCode: 200,
        header: {},
        cookies: ""
      }
      resolve(response)
    });
  }

  // static startRequest(urlPath: string, method: http.RequestMethod) {
  //
  //   let context = globalThis.sharedContext as common.UIAbilityContext;
  //   console.log(`context: ${context}`)
  //   let resourceManager = context.resourceManager;
  //   return resourceManager.getRawFileContent("host_config.json").then(value => {
  //     let rawFile = value;
  //     let textDecoder = util.TextDecoder.create('utf-8', { ignoreBOM: true })
  //     let retStr = textDecoder.decodeWithStream(rawFile, { stream: false });
  //
  //     console.info('host_config打印: ' + JSON.stringify(retStr));
  //     let response: http.HttpResponse = {
  //       result: JSON.stringify(retStr),
  //       resultType: http.HttpDataType.STRING,
  //       responseCode: 200,
  //       header: {},
  //       cookies: ""
  //     }
  //     return response
  //   })
  // }
}