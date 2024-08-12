import 'package:shared_preferences/shared_preferences.dart';

class TrainDn {
  final String image;
  final String title;
  final String subTitle;
  final int min;
  final int kcal;
  final List<Det> det;

  TrainDn({
    required this.image,
    required this.title,
    required this.subTitle,
    required this.min,
    required this.kcal,
    required this.det,
  });
}

class Det {
  final String image;
  final String title;
  final int min;
  final String starting;
  final String execution;
  final String repetitions;
  Det({
    required this.image,
    required this.title,
    required this.min,
    required this.starting,
    required this.execution,
    required this.repetitions,
  });
}

Future<int> getKcal() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getInt('Kcal') ?? 0;
}

Future<void> setKcal(int traning) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setInt('Kcal', traning);
}

Future<int> getWrk() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getInt('Wrk') ?? 0;
}

Future<void> setWrk(int traning) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setInt('Wrk', traning);
}

List<TrainDn> listWork = [
  TrainDn(
    image: 'assets/images/wrk1.png',
    title: 'Core Strength Builder',
    subTitle:
        '''A focused workout designed to strengthen and tone your core muscles, improving stability and balance. This routine engages multiple muscle groups, providing a comprehensive challenge for your midsection.''',
    min: 18,
    kcal: 220,
    det: [
      Det(
        image: 'assets/wrk/a1.png',
        title: 'Bicycle Crunches',
        min: 2,
        starting:
            'Begin by lying flat on your back on a comfortable surface. Place your hands lightly behind your head, with elbows pointing outwards.',
        execution:
            'Initiate the movement by bringing your right elbow towards your left knee, while simultaneously extending your right leg straight out. As you twist, engage your obliques to increase the contraction in your core. Switch sides by bringing your left elbow towards your right knee, continuing the pedaling motion. Keep a steady rhythm and focus on fully extending each leg.',
        repetitions:
            'Aim to alternate sides continuously, performing 20-25 repetitions per minute. Focus on maintaining form and breathing evenly throughout the exercise.',
      ),
      Det(
        image: 'assets/wrk/a2.png',
        title: 'Leg Raises',
        min: 3,
        starting:
            'Lie flat on your back with your legs fully extended. Place your hands under your hips or alongside your body for support.',
        execution:
            'Slowly lift both legs towards the ceiling, keeping them straight and together. Pause briefly at the top, then lower your legs back down in a controlled manner, stopping just before they touch the floor. Avoid arching your back or using momentum to lift your legs. The movement should be slow and deliberate, engaging your lower abdominal muscles.',
        repetitions:
            'Perform 10-15 leg raises per minute, focusing on controlled movement and core engagement.',
      ),
      Det(
        image: 'assets/wrk/a3.png',
        title: 'Russian Twists',
        min: 2,
        starting:
            'Sit on the floor with your knees bent and feet flat on the ground. Lean back slightly, keeping your back straight, to create tension in your core.',
        execution:
            'Twist your torso to the right, bringing your hands towards the floor beside your hip. Immediately twist to the left, keeping your core tight and balanced throughout the movement. The twist should come from your torso, not just your arms, and your eyes should follow the direction of your hands.',
        repetitions:
            'Aim for 30-40 twists per minute, alternating sides. Focus on controlled movement and maintaining balance as you twist from side to side.',
      ),
      Det(
        image: 'assets/wrk/a4.png',
        title: 'Mountain Climbers',
        min: 3,
        starting:
            'Start in a high plank position with your hands directly under your shoulders, fingers spread for stability.',
        execution:
            ' Begin the movement by driving your right knee towards your chest, then quickly switch legs, bringing your left knee towards your chest as you extend your right leg back to the starting position. Continue alternating legs in a running motion, maintaining a quick but controlled pace. Focus on keeping your hips level and your core tight to prevent your lower back from sagging.',
        repetitions:
            'Keep up a steady pace, aiming for 40-50 repetitions per minute. Ensure each knee drive is powerful and controlled, maintaining form throughout the exercise.',
      ),
    ],
  ),
  TrainDn(
    image: 'assets/images/wrk2.png',
    title: 'Full Body Burner',
    subTitle:
        '''A dynamic and energizing workout designed to target your entire body, improving strength, endurance, and overall fitness. This session combines cardio, strength, and core exercises to maximize calorie burn and build lean muscle.''',
    min: 20,
    kcal: 200,
    det: [
      Det(
        image: 'assets/wrk/b1.png',
        title: 'Jumping Jacks',
        min: 3,
        starting:
            'Stand upright with your feet together, ensuring your back is straight and your arms are relaxed at your sides.',
        execution:
            'Begin by jumping your feet out to shoulder-width apart while simultaneously raising your arms above your head. Land softly on the balls of your feet, with knees slightly bent to absorb the impact. Quickly reverse the movement, bringing your feet back together and lowering your arms to your sides.',
        repetitions:
            'Perform the exercise continuously, maintaining a steady pace. Aim to complete as many jumping jacks as possible within the 3-minute time frame, taking short breaks if necessary.',
      ),
      Det(
        image: 'assets/wrk/b2.png',
        title: 'Bodyweight Squats',
        min: 4,
        starting:
            'Stand with your feet shoulder-width apart and your toes slightly pointed outward. Engage your core and keep your chest lifted, looking straight ahead.',
        execution:
            'Begin by bending your knees and pushing your hips back as if sitting into an invisible chair. Lower your body until your thighs are parallel to the floor, ensuring that your knees do not extend beyond your toes.',
        repetitions:
            'Perform squats continuously for the duration of the exercise, aiming to complete as many reps as possible. Focus on maintaining proper form, even as fatigue sets in.',
      ),
      Det(
        image: 'assets/wrk/b3.png',
        title: 'Plank',
        min: 3,
        starting:
            'Begin on the floor with your forearms placed directly under your shoulders, elbows bent at 90 degrees.',
        execution:
            'Hold the plank position, focusing on maintaining a straight line with your body. Avoid letting your hips sag or rise too high, and ensure your shoulders remain directly over your elbows. Breathe steadily, and continue to engage your core, glutes, and leg muscles to keep your body stable and aligned.',
        repetitions:
            'Maintain the plank position without dropping to the floor. If needed, take brief rest breaks by lowering your knees, but aim to hold the plank for as much of the 3-minute duration as possible.',
      ),
      Det(
        image: 'assets/wrk/b4.png',
        title: 'Lunges',
        min: 4,
        starting:
            'Stand tall with your feet together, ensuring your posture is upright and your core is engaged.',
        execution:
            'Step forward with your right leg, lowering your hips until both knees are bent at approximately 90 degrees. Ensure your front knee is directly above your ankle and your back knee hovers just above the floor. Push off with your front foot to return to the starting position.',
        repetitions:
            'Continue alternating lunges for the full 4 minutes. Aim to perform as many repetitions as possible while maintaining good form. Take brief pauses if necessary, but strive to keep moving throughout the entire duration.',
      ),
    ],
  ),
  TrainDn(
    image: 'assets/images/wrk3.png',
    title: 'Total Body Toning',
    subTitle:
        '''This workout is designed to tone and strengthen all major muscle groups, giving you a full-body challenge. It's perfect for those looking to build strength and endurance with minimal equipment.''',
    min: 18,
    kcal: 180,
    det: [
      Det(
        image: 'assets/wrk/c1.png',
        title: 'Squat to Press',
        min: 4,
        starting:
            'Stand with your feet shoulder-width apart, holding a pair of light dumbbells or any household item like water bottles at shoulder height, palms facing inwards. Engage your core and keep your chest lifted.',
        execution:
            'Lower your body into a squat by bending your knees and pushing your hips back, as if sitting into a chair. Keep your back straight and your weight in your heels. As you rise from the squat, press the weights overhead, fully extending your arms. Lower the weights back to your shoulders as you descend into the next squat.',
        repetitions:
            'Aim for 12-15 repetitions per minute, focusing on maintaining a steady pace and good form throughout the movement.',
      ),
      Det(
        image: 'assets/wrk/c2.png',
        title: 'Plank Row',
        min: 4,
        starting:
            'Begin in a high plank position with your hands gripping dumbbells (or similar objects) placed directly under your shoulders.',
        execution:
            'Keeping your core tight and hips level, lift one dumbbell off the floor by bending your elbow, bringing it towards your ribcage in a rowing motion. Lower the dumbbell back to the floor and repeat on the opposite side. Avoid rotating your hips or shoulders during the movement; the goal is to keep your body as stable as possible.',
        repetitions:
            'Perform 10-12 rows per minute on each side, alternating between arms. Focus on controlled movement and maintaining a strong plank position.',
      ),
      Det(
        image: 'assets/wrk/c3.png',
        title: 'Lunge with Bicep Curl',
        min: 3,
        starting:
            'Stand with your feet hip-width apart, holding a pair of dumbbells by your sides with palms facing forward. Engage your core and keep your shoulders back.',
        execution:
            'Step forward with one leg into a lunge, bending both knees to 90 degrees. As you lower into the lunge, simultaneously perform a bicep curl by bending your elbows and bringing the weights towards your shoulders. Push back to the starting position while lowering the weights back down. Alternate legs with each repetition.',
        repetitions:
            'Aim for 10-12 lunges per minute on each leg, maintaining balance and coordination throughout the exercise.',
      ),
      Det(
        image: 'assets/wrk/c4.png',
        title: 'Superman Hold',
        min: 3,
        starting:
            'Lie face down on the floor with your arms extended straight in front of you and your legs fully extended behind. Keep your neck neutral by looking down at the floor.',
        execution:
            'Simultaneously lift your arms, chest, and legs off the floor as high as possible, engaging your lower back, glutes, and hamstrings. Hold this position at the top, squeezing your muscles tightly. Lower back down in a controlled manner and repeat. The movement should be slow and focused to maximize muscle engagement.',
        repetitions:
            'Perform 8-10 superman holds per minute, holding each position for a few seconds before lowering.',
      ),
    ],
  ),
  TrainDn(
    image: 'assets/images/wrk4.png',
    title: 'Upper Body Blast',
    subTitle:
        '''This workout is designed to target your upper body muscles, focusing on building streBegin in a high plank position with your hands slightly wider than shoulder-width apart, fingers pointing forward.ngth and endurance in your arms, shoulders, chest, and back.''',
    min: 22,
    kcal: 220,
    det: [
      Det(
        image: 'assets/wrk/d1.png',
        title: 'Jumping Jacks',
        min: 5,
        starting:
            'Begin in a high plank position with your hands slightly wider than shoulder-width apart, fingers pointing forward.',
        execution:
            'Lower your body towards the floor by bending your elbows, keeping them close to your body. Lower yourself until your chest is just above the ground, then push through your palms to return to the starting position.',
        repetitions:
            'Perform as many push-ups as possible within the 5-minute timeframe. If needed, modify the exercise by dropping to your knees, but aim to maintain proper form throughout.',
      ),
      Det(
        image: 'assets/wrk/d2.png',
        title: 'Tricep Dips',
        min: 4,
        starting:
            'Sit on the edge of a sturdy chair or bench with your hands gripping the edge, fingers facing forward.',
        execution:
            'Lower your body by bending your elbows, bringing your hips towards the floor. Keep your elbows pointing directly behind you, and lower yourself until your arms form a 90-degree angle. Push through your palms to lift your body back to the starting position.',
        repetitions:
            'Continue performing tricep dips for the entire 4 minutes, focusing on a steady pace and proper form. If needed, bend your knees to make the exercise easier.',
      ),
      Det(
        image: 'assets/wrk/d3.png',
        title: 'Pike Push-Ups',
        min: 4,
        starting:
            'Begin in a downward dog position, with your hands on the floor shoulder-width apart and your hips raised towards the ceiling, forming an inverted V shape.',
        execution:
            'Bend your elbows to lower your head towards the floor, keeping your elbows tucked in close to your body. Lower yourself until your head almost touches the ground, then push through your hands to return to the starting position.',
        repetitions:
            'Perform as many pike push-ups as possible within the 4-minute duration. Focus on maintaining proper form, even as your shoulders fatigue.',
      ),
      Det(
        image: 'assets/wrk/d4.png',
        title: 'Plank Shoulder Taps',
        min: 4,
        starting:
            'Begin in a high plank position with your hands directly under your shoulders and your body forming a straight line from head to heels.',
        execution:
            'Lift your right hand off the ground and tap your left shoulder, keeping your hips as still as possible. Return your right hand to the starting position and immediately lift your left hand to tap your right shoulder.',
        repetitions:
            'Perform continuous shoulder taps for the entire 4 minutes, aiming to keep a steady pace. If needed, widen your stance to help maintain balance, but strive to keep your body as stable as possible.',
      ),
    ],
  ),
  TrainDn(
    image: 'assets/images/wrk5.png',
    title: 'Total Gym Strength',
    subTitle:
        '''A comprehensive gym workout designed to build strength across all major muscle groups. This routine incorporates a mix of free weights, machines, and bodyweight exercises to maximize muscle engagement and promote balanced development.''',
    min: 30,
    kcal: 310,
    det: [
      Det(
        image: 'assets/wrk/e1.png',
        title: 'Barbell Deadlift',
        min: 10,
        starting:
            'Stand with your feet hip-width apart, with a barbell on the floor in front of you. Bend at your hips and knees, keeping your back straight, and grip the barbell with your hands slightly wider than shoulder-width apart.',
        execution:
            'Push through your heels and extend your hips and knees to lift the barbell off the ground, keeping it close to your body.',
        repetitions:
            'Perform 4 sets of 8-10 repetitions. Rest for 90 seconds between sets.',
      ),
      Det(
        image: 'assets/wrk/e2.png',
        title: 'Bench Press',
        min: 10,
        starting:
            'Lie flat on a bench with your feet planted firmly on the floor. Grip the barbell with your hands slightly wider than shoulder-width apart, and lift it off the rack, holding it directly above your chest with your arms extended.',
        execution:
            'Lower the barbell slowly towards your chest by bending your elbows, keeping your wrists straight and your elbows at about a 45-degree angle from your body.',
        repetitions:
            'Perform 4 sets of 8-10 repetitions. Rest for 90 seconds between sets.',
      ),
      Det(
        image: 'assets/wrk/e3.png',
        title: 'Lat Pulldown',
        min: 5,
        starting:
            'Sit at a lat pulldown machine with your feet flat on the floor. Adjust the knee pad so it fits snugly over your thighs to keep you seated.',
        execution:
            'Pull the bar down towards your upper chest, bringing your shoulder blades together as you pull. Keep your back straight and avoid leaning too far back. Slowly return the bar to the starting position with controlled motion, ensuring your arms fully extend.',
        repetitions:
            'Perform 3 sets of 10-12 repetitions. Rest for 60 seconds between sets.',
      ),
      Det(
        image: 'assets/wrk/e4.png',
        title: 'Leg Press',
        min: 5,
        starting:
            'Sit on a leg press machine with your feet placed shoulder-width apart on the platform. Adjust the seat so that your knees are at a 90-degree angle when your feet are on the platform. Engage your core and prepare to push.',
        execution:
            'Push the platform away by extending your legs, keeping your feet flat and your knees aligned with your toes. Avoid locking your knees at the top of the movement. Slowly lower the platform back down by bending your knees, bringing them towards your chest. Maintain control throughout the movement.',
        repetitions:
            'Perform 3 sets of 12-15 repetitions. Rest for 60 seconds between sets.',
      ),
    ],
  ),
  TrainDn(
    image: 'assets/images/wrk6.png',
    title: 'Push-Pull Power',
    subTitle:
        '''A balanced push-pull workout designed to target your upper body muscles, focusing on both pushing and pulling movements to ensure well-rounded strength development. This routine combines free weights and machines to maximize muscle engagement and enhance overall power and endurance.''',
    min: 40,
    kcal: 360,
    det: [
      Det(
        image: 'assets/wrk/f1.png',
        title: 'Dumbbell Shoulder Press',
        min: 10,
        starting:
            'Sit on a bench with back support, holding a dumbbell in each hand at shoulder height with your palms facing forward.',
        execution:
            'Press the dumbbells overhead by extending your arms fully, keeping your wrists straight and your movements controlled. Slowly lower the dumbbells back to shoulder height without losing control. Avoid arching your back as you press.',
        repetitions:
            'Perform 4 sets of 8-10 repetitions. Rest for 90 seconds between sets.',
      ),
      Det(
        image: 'assets/wrk/f2.png',
        title: 'Bent-Over Barbell Rows',
        min: 10,
        starting:
            'Stand with your feet shoulder-width apart, holding a barbell with an overhand grip. Bend at your hips and knees, keeping your back flat.',
        execution:
            'Pull the barbell towards your lower ribcage, squeezing your shoulder blades together at the top of the movement. Lower the barbell back to the starting position in a controlled manner.',
        repetitions:
            'Perform 4 sets of 8-10 repetitions. Rest for 90 seconds between sets.',
      ),
      Det(
        image: 'assets/wrk/f3.png',
        title: 'Incline Dumbbell Press',
        min: 1,
        starting:
            'Lie on an incline bench set at about 30-45 degrees, holding a dumbbell in each hand with your arms extended above your chest. Keep your feet flat on the floor and your core engaged.',
        execution:
            'Lower the dumbbells slowly towards your chest by bending your elbows, keeping your wrists straight and your elbows at a slight angle to your body. Press the dumbbells back up to the starting position, fully extending your arms while maintaining control.',
        repetitions:
            'Perform 4 sets of 8-10 repetitions. Rest for 90 seconds between sets.',
      ),
      Det(
        image: 'assets/wrk/f4.png',
        title: 'Cable Face Pulls',
        min: 1,
        starting:
            'Attach a rope handle to a cable machine set at upper chest height. Stand facing the machine, with your feet shoulder-width apart and your knees slightly bent.',
        execution:
            'Pull the rope towards your face, leading with your elbows and separating your hands as you pull. Squeeze your shoulder blades together at the peak of the movement. Slowly return the rope to the starting position, keeping your movements controlled and your core engaged.',
        repetitions:
            'Perform 3 sets of 12-15 repetitions. Rest for 60 seconds between sets.',
      ),
    ],
  ),
  TrainDn(
    image: 'assets/images/wrk7.png',
    title: 'Leg Day Powerhouse',
    subTitle:
        '''This intense leg day workout is designed to build strength and endurance in your lower body, targeting quads, hamstrings, glutes, and calves.''',
    min: 40,
    kcal: 350,
    det: [
      Det(
        image: 'assets/wrk/g1.png',
        title: 'Barbell Squats',
        min: 10,
        starting:
            'Stand with your feet shoulder-width apart, holding a barbell across your upper back (trapezius muscles). Keep your chest up, core engaged, and your back straight.',
        execution:
            'Lower your body by bending at the hips and knees, as if sitting back into a chair. Continue lowering until your thighs are parallel to the ground or slightly below. Push through your heels to return to the starting position, fully extending your hips and knees at the top. Keep your chest up and avoid letting your knees cave inward.',
        repetitions:
            'Perform 4 sets of 8-10 repetitions. Rest for 2 minutes between sets.',
      ),
      Det(
        image: 'assets/wrk/g2.png',
        title: 'Leg Curl',
        min: 10,
        starting:
            'Sit on a leg curl machine and adjust the pad so it rests comfortably on the back of your lower legs.',
        execution:
            'Curl your legs downward by bending your knees, pulling the pad towards the back of your thighs. Squeeze your hamstrings at the bottom of the movement, then slowly return the weight to the starting position with control.',
        repetitions:
            'Perform 4 sets of 12-15 repetitions. Rest for 60 seconds between sets.',
      ),
      Det(
        image: 'assets/wrk/g3.png',
        title: 'Leg Extension',
        min: 5,
        starting:
            'Sit on a leg extension machine and adjust the pad so it rests comfortably against the front of your lower legs, just above your ankles. Grip the handles on the sides of the machine for stability.',
        execution:
            'Extend your legs by straightening your knees, lifting the pad until your legs are fully extended in front of you. Squeeze your quadriceps at the top of the movement, then slowly lower the weight back to the starting position with control.',
        repetitions:
            'Perform 4 sets of 12-15 repetitions. Rest for 60 seconds between sets.',
      ),
      Det(
        image: 'assets/wrk/g4.png',
        title: 'Romanian Deadlift',
        min: 5,
        starting:
            'Stand with your feet hip-width apart, holding a barbell in front of your thighs with an overhand grip. Keep your knees slightly bent, your back straight, and your core engaged.',
        execution:
            'Hinge at the hips to lower the barbell towards the ground, keeping it close to your legs. Lower the barbell until you feel a stretch in your hamstrings, then drive your hips forward to return to the starting position. Keep your back flat throughout the movement.',
        repetitions:
            'Perform 4 sets of 8-10 repetitions. Rest for 90 seconds between sets.',
      ),
      Det(
        image: 'assets/wrk/g5.png',
        title: 'Calf Raises',
        min: 10,
        starting:
            'Stand on a calf raise machine with your feet positioned on the platform so that your heels hang off the edge. Place the pads on your shoulders and engage your core for stability.',
        execution:
            'Raise your heels as high as possible by pushing through the balls of your feet, contracting your calf muscles at the top. Slowly lower your heels back to the starting position, allowing for a full stretch of your calves.',
        repetitions:
            'Perform 4 sets of 15-20 repetitions. Rest for 60 seconds between sets.',
      ),
    ],
  ),
  TrainDn(
    image: 'assets/images/wrk8.png',
    title: 'Back & Biceps Blast',
    subTitle:
        '''This workout is designed to target your back and biceps, focusing on pulling movements that develop strength and muscle definition.''',
    min: 55,
    kcal: 450,
    det: [
      Det(
        image: 'assets/wrk/s1.png',
        title: 'Pull-Ups',
        min: 10,
        starting:
            'Hang from a pull-up bar with your hands shoulder-width apart, palms facing away from you (overhand grip). Engage your core, and keep your legs straight or slightly bent.',
        execution:
            'Pull your body up towards the bar by squeezing your shoulder blades together and driving your elbows down. Continue pulling until your chin is above the bar, then slowly lower yourself back to the starting position with control. Avoid swinging or using momentum.',
        repetitions:
            'Perform 4 sets of as many repetitions as possible. Rest for 90 seconds between sets.',
      ),
      Det(
        image: 'assets/wrk/s2.png',
        title: 'Seated Cable Rows',
        min: 10,
        starting:
            'Sit at a cable row machine with your feet planted on the footrests and your knees slightly bent. Grip the handle with both hands, keeping your back straight and chest forward.',
        execution:
            'Pull the handle towards your torso, focusing on squeezing your shoulder blades together as you pull. Keep your elbows close to your body and avoid leaning back during the movement. Slowly return the handle to the starting position, maintaining control throughout.',
        repetitions:
            'Perform 4 sets of 10-12 repetitions. Rest for 60 seconds between sets.',
      ),
      Det(
        image: 'assets/wrk/s3.png',
        title: 'Barbell Bent-Over Rows',
        min: 10,
        starting:
            'Stand with your feet shoulder-width apart, holding a barbell with an overhand grip. Bend at your hips and knees, keeping your back straight, so your torso is at about a 45-degree angle to the floor. Let the barbell hang at arms length from your shoulders.',
        execution:
            'Pull the barbell towards your lower ribcage, squeezing your shoulder blades together at the top of the movement. Lower the barbell back to the starting position in a controlled manner. Avoid using momentum or rounding your back.',
        repetitions:
            'Perform 4 sets of 8-10 repetitions. Rest for 90 seconds between sets.',
      ),
      Det(
        image: 'assets/wrk/s4.png',
        title: 'Concentration Curls',
        min: 10,
        starting:
            'Sit on a bench with your legs spread apart. Hold a dumbbell in one hand and rest your elbow on the inside of your thigh, letting the dumbbell hang towards the floor.',
        execution:
            'Curl the dumbbell towards your shoulder by bending your elbow, focusing on squeezing your bicep at the top of the movement. Slowly lower the dumbbell back to the starting position with control. Keep the movement isolated to your bicep.',
        repetitions:
            'Perform 3 sets of 10-12 repetitions per arm. Rest for 60 seconds between sets.',
      ),
      Det(
        image: 'assets/wrk/s5.png',
        title: 'Hammer Curls',
        min: 15,
        starting:
            'Stand with your feet shoulder-width apart, holding a dumbbell in each hand with your arms fully extended by your sides. Your palms should be facing your torso (neutral grip).',
        execution:
            'Curl the dumbbells towards your shoulders by bending your elbows, keeping your wrists straight and palms facing inward throughout the movement. Squeeze your biceps at the top, then slowly lower the dumbbells back to the starting position.',
        repetitions:
            'Perform 4 sets of 10-12 repetitions. Rest for 60 seconds between sets.',
      ),
    ],
  ),
];
