// Test data for the stories.
import 'package:pic_connect/domain/models/reel.dart';

const userNames = [
  'Esther W Roberts',
  'Virgil T Vogel',
  'Paula A Dixon',
  'Barbara W Yanez',
  'Johnny N Hayes',
];
const profilePics = [
  'https://www.fakepersongenerator.com/Face/female/female1023053261475.jpg',
  'https://www.fakepersongenerator.com/Face/male/male1085513896637.jpg',
  'https://www.fakepersongenerator.com/Face/female/female20131023576348938.jpg',
  'https://www.fakepersongenerator.com/Face/female/female1021769569641.jpg',
  'https://www.fakepersongenerator.com/Face/male/male20161086415248322.jpg',
];
const videoUrls = [
  'https://assets.mixkit.co/videos/preview/mixkit-girl-in-neon-sign-1232-large.mp4',
  'https://assets.mixkit.co/videos/preview/mixkit-man-under-multicolored-lights-1237-large.mp4',
  'https://assets.mixkit.co/videos/preview/mixkit-mother-with-her-little-daughter-eating-a-marshmallow-in-nature-39764-large.mp4',
];
const imageUrls = [
  'https://images.unsplash.com/photo-1651979822227-31948d6c83bc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
  'https://images.unsplash.com/photo-1641978909561-015aaa540119?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
  'https://images.unsplash.com/photo-1652007682665-e06a8ac589dd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
  'https://images.unsplash.com/photo-1641981601596-39a7403ebf47?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80',
  'https://images.unsplash.com/photo-1593642634443-44adaa06623a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1325&q=80',
  'https://images.unsplash.com/photo-1641982661987-351363e6785e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=765&q=80',
  'https://images.unsplash.com/photo-1641982705401-1f0ed07ff5d0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=699&q=80',
];

List<ReelBO> reelsList = [
  ReelBO(
      id: "hfjhdsjkfhsdjkf",
      url:
          'https://assets.mixkit.co/videos/preview/mixkit-tree-with-yellow-flowers-1173-large.mp4',
      userName: 'Sergio Sánchez',
      likeCount: 2000,
      isLiked: true,
      musicName: 'In the name of Love',
      description: "Life is better when you're laughing.",
      profileUrl:
          'https://avatars.githubusercontent.com/u/6996211?v=4',
      commentList: []),
  ReelBO(
    id: "asdasdsadasdas",
    url:
        'https://assets.mixkit.co/videos/preview/mixkit-father-and-his-little-daughter-eating-marshmallows-in-nature-39765-large.mp4',
    userName: 'Sergio Sánchez',
    musicName: 'In the name of Love',
    description: "Life is better when you're laughing.",
    profileUrl:
        'https://avatars.githubusercontent.com/u/6996211?v=4',
    isLiked: false,
    likeCount: 0,
    commentList: [],
  ),
  ReelBO(
    id: "fdsfsdfdsfds",
    url:
        'https://assets.mixkit.co/videos/preview/mixkit-mother-with-her-little-daughter-eating-a-marshmallow-in-nature-39764-large.mp4',
    userName: 'Sergio Sánchez',
    isLiked: true,
    likeCount: 1,
    profileUrl:
        'https://avatars.githubusercontent.com/u/6996211?v=4',
    description: '',
    musicName: '',
    commentList: [],
  ),
];
