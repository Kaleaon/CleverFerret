.class public Lcom/flyersoft/components/MyShakeSensorListener;
.super Ljava/lang/Object;
.source "MyShakeSensorListener.java"

# interfaces
.implements Landroid/hardware/SensorEventListener;


# instance fields
.field private lastSensorUpdate:J

.field private lastShakeTime:J

.field private last_sx:F

.field private last_sy:F

.field private last_sz:F

.field private speedTime1:J

.field private sx_move1:F

.field public tilt_action_time:J

.field public tilt_base_z:F

.field public tilt_center_time:J

.field tilt_down:F

.field public tilt_down_time:J

.field public tilt_hold_count:I

.field public tilt_hold_time:J

.field public tilt_paused:Z

.field public tilt_turn_page:Z

.field tilt_up:F

.field public tilt_up_time:J

.field public tilt_x:F

.field public tilt_y:F

.field public tilt_z:F


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, -0x1

    .line 21
    iput-wide v0, p0, Lcom/flyersoft/components/MyShakeSensorListener;->lastShakeTime:J

    iput-wide v0, p0, Lcom/flyersoft/components/MyShakeSensorListener;->speedTime1:J

    .line 14
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/flyersoft/components/MyShakeSensorListener;->lastSensorUpdate:J

    const/high16 v0, -0x40800000    # -1.0f

    .line 15
    iput v0, p0, Lcom/flyersoft/components/MyShakeSensorListener;->last_sx:F

    .line 16
    iput v0, p0, Lcom/flyersoft/components/MyShakeSensorListener;->tilt_x:F

    return-void
.end method

.method private doTiltEvent(I)V
    .locals 2

    const/4 v0, 0x1

    if-nez p1, :cond_0

    .line 200
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget v1, p0, Lcom/flyersoft/components/MyShakeSensorListener;->tilt_down:F

    invoke-virtual {p1, v0, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->flingPageScroll(ZF)V

    return-void

    :cond_0
    if-ne p1, v0, :cond_1

    .line 202
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/4 v0, 0x0

    iget v1, p0, Lcom/flyersoft/components/MyShakeSensorListener;->tilt_up:F

    invoke-virtual {p1, v0, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->flingPageScroll(ZF)V

    :cond_1
    return-void
.end method

.method private do_tilt_event(Landroid/hardware/SensorEvent;)V
    .locals 23

    move-object/from16 v1, p0

    move-object/from16 v0, p1

    const-string v2, "----------page up: "

    const-string v3, "=========page down: "

    const-string v4, "down:"

    const-string v5, "up:"

    const-string v6, "cednter:"

    const-string v7, "base_z:"

    .line 103
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v8

    .line 104
    iget-object v10, v0, Landroid/hardware/SensorEvent;->values:[F

    const/4 v11, 0x0

    aget v10, v10, v11

    .line 105
    iget-object v12, v0, Landroid/hardware/SensorEvent;->values:[F

    const/4 v13, 0x1

    aget v12, v12, v13

    .line 106
    iget-object v0, v0, Landroid/hardware/SensorEvent;->values:[F

    const/4 v14, 0x2

    aget v14, v0, v14

    .line 108
    :try_start_0
    iget v0, v1, Lcom/flyersoft/components/MyShakeSensorListener;->tilt_x:F
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    const/high16 v15, -0x40800000    # -1.0f

    cmpl-float v15, v0, v15

    if-nez v15, :cond_0

    .line 192
    :goto_0
    iput v10, v1, Lcom/flyersoft/components/MyShakeSensorListener;->tilt_x:F

    .line 193
    iput v12, v1, Lcom/flyersoft/components/MyShakeSensorListener;->tilt_y:F

    .line 194
    :goto_1
    iput v14, v1, Lcom/flyersoft/components/MyShakeSensorListener;->tilt_z:F

    return-void

    :cond_0
    sub-float v0, v10, v0

    float-to-int v0, v0

    .line 111
    :try_start_1
    iget v15, v1, Lcom/flyersoft/components/MyShakeSensorListener;->tilt_y:F

    sub-float v15, v12, v15

    float-to-int v15, v15

    const/16 v16, 0x1

    .line 112
    iget v13, v1, Lcom/flyersoft/components/MyShakeSensorListener;->tilt_z:F

    sub-float v13, v14, v13

    float-to-int v13, v13

    .line 113
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result v11

    move/from16 p1, v0

    .line 114
    invoke-static {v15}, Ljava/lang/Math;->abs(I)I

    move-result v0

    move/from16 v18, v13

    .line 115
    invoke-static/range {v18 .. v18}, Ljava/lang/Math;->abs(I)I

    move-result v13

    .line 117
    invoke-static {v12}, Ljava/lang/Math;->abs(F)F

    move-result v19

    invoke-static {v10}, Ljava/lang/Math;->abs(F)F

    move-result v20
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    sub-float v19, v19, v20

    const/high16 v20, 0x40a00000    # 5.0f

    cmpl-float v19, v19, v20

    if-lez v19, :cond_1

    const/16 v19, 0x1

    goto :goto_2

    :cond_1
    const/16 v19, 0x0

    :goto_2
    move/from16 v20, v15

    const v21, 0x461c4000    # 10000.0f

    const/4 v15, 0x4

    if-gt v11, v15, :cond_14

    if-le v0, v15, :cond_2

    goto/16 :goto_8

    .line 130
    :cond_2
    const-string v15, "MR2"

    move-object/from16 v22, v2

    if-nez p1, :cond_4

    if-nez v20, :cond_4

    if-nez v18, :cond_4

    .line 131
    :try_start_2
    iget v2, v1, Lcom/flyersoft/components/MyShakeSensorListener;->tilt_hold_count:I

    add-int/lit8 v2, v2, 0x1

    iput v2, v1, Lcom/flyersoft/components/MyShakeSensorListener;->tilt_hold_count:I

    move-object/from16 v16, v3

    const/4 v3, 0x3

    if-le v2, v3, :cond_5

    .line 132
    iget-wide v2, v1, Lcom/flyersoft/components/MyShakeSensorListener;->tilt_hold_time:J

    sub-long v2, v8, v2

    const-wide/16 v17, 0x1f4

    cmp-long v20, v2, v17

    if-lez v20, :cond_5

    .line 133
    iput-wide v8, v1, Lcom/flyersoft/components/MyShakeSensorListener;->tilt_hold_time:J

    .line 134
    iget v2, v1, Lcom/flyersoft/components/MyShakeSensorListener;->tilt_base_z:F

    cmpl-float v3, v2, v14

    if-eqz v3, :cond_3

    const/4 v3, 0x0

    .line 135
    iput v3, v1, Lcom/flyersoft/components/MyShakeSensorListener;->tilt_up:F

    iput v3, v1, Lcom/flyersoft/components/MyShakeSensorListener;->tilt_down:F

    :cond_3
    cmpl-float v2, v2, v14

    if-eqz v2, :cond_5

    .line 137
    iput v14, v1, Lcom/flyersoft/components/MyShakeSensorListener;->tilt_base_z:F

    .line 138
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v2, v1, Lcom/flyersoft/components/MyShakeSensorListener;->tilt_base_z:F

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v15, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    :cond_4
    move-object/from16 v16, v3

    const/4 v2, 0x0

    .line 143
    iput v2, v1, Lcom/flyersoft/components/MyShakeSensorListener;->tilt_hold_count:I

    .line 145
    :cond_5
    iget v2, v1, Lcom/flyersoft/components/MyShakeSensorListener;->tilt_base_z:F

    sub-float v2, v14, v2

    .line 146
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v3

    if-eqz v19, :cond_6

    const v7, 0x3fb33333    # 1.4f

    goto :goto_3

    :cond_6
    const/high16 v7, 0x3f800000    # 1.0f

    .line 147
    :goto_3
    invoke-direct {v1, v2}, Lcom/flyersoft/components/MyShakeSensorListener;->getSensivityValue(F)F

    move-result v17
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    mul-float v7, v7, v17

    move/from16 v18, v12

    .line 148
    :try_start_3
    iget v12, v1, Lcom/flyersoft/components/MyShakeSensorListener;->tilt_base_z:F

    cmpl-float v12, v12, v21

    if-eqz v12, :cond_13

    move-object v12, v5

    move-object/from16 v17, v6

    iget-wide v5, v1, Lcom/flyersoft/components/MyShakeSensorListener;->tilt_action_time:J
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    sub-long v5, v8, v5

    const-wide/16 v19, 0x12c

    cmp-long v21, v5, v19

    if-lez v21, :cond_13

    if-lt v13, v11, :cond_13

    if-lt v13, v0, :cond_13

    .line 151
    const-string v0, " z:"

    const-string v5, " move:"

    cmpl-float v6, v2, v7

    if-lez v6, :cond_9

    :try_start_4
    iget v6, v1, Lcom/flyersoft/components/MyShakeSensorListener;->tilt_up:F

    const/4 v11, 0x0

    cmpl-float v13, v6, v11

    if-eqz v13, :cond_7

    neg-float v6, v6

    cmpl-float v6, v3, v6

    if-lez v6, :cond_9

    .line 152
    :cond_7
    iget v6, v1, Lcom/flyersoft/components/MyShakeSensorListener;->tilt_down:F

    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    move-result v6

    cmpl-float v6, v3, v6

    if-lez v6, :cond_8

    .line 153
    iput v2, v1, Lcom/flyersoft/components/MyShakeSensorListener;->tilt_down:F

    .line 154
    :cond_8
    iput-wide v8, v1, Lcom/flyersoft/components/MyShakeSensorListener;->tilt_down_time:J

    const/4 v11, 0x0

    .line 155
    iput v11, v1, Lcom/flyersoft/components/MyShakeSensorListener;->tilt_up:F

    .line 156
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object v4, v12

    iget-wide v11, v1, Lcom/flyersoft/components/MyShakeSensorListener;->tilt_down_time:J

    invoke-virtual {v6, v11, v12}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    float-to-int v11, v14

    invoke-virtual {v6, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v11, " tilt_sensitivity:"

    invoke-virtual {v6, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v15, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_4

    :cond_9
    move-object v4, v12

    :goto_4
    neg-float v6, v7

    cmpg-float v6, v2, v6

    if-gez v6, :cond_c

    .line 158
    iget v6, v1, Lcom/flyersoft/components/MyShakeSensorListener;->tilt_down:F

    const/4 v11, 0x0

    cmpl-float v7, v6, v11

    if-eqz v7, :cond_a

    cmpl-float v6, v3, v6

    if-lez v6, :cond_c

    .line 159
    :cond_a
    iget v6, v1, Lcom/flyersoft/components/MyShakeSensorListener;->tilt_up:F

    neg-float v6, v6

    cmpl-float v6, v3, v6

    if-lez v6, :cond_b

    .line 160
    iput v2, v1, Lcom/flyersoft/components/MyShakeSensorListener;->tilt_up:F

    .line 161
    :cond_b
    iput-wide v8, v1, Lcom/flyersoft/components/MyShakeSensorListener;->tilt_up_time:J

    const/4 v11, 0x0

    .line 162
    iput v11, v1, Lcom/flyersoft/components/MyShakeSensorListener;->tilt_down:F

    .line 163
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-wide v11, v1, Lcom/flyersoft/components/MyShakeSensorListener;->tilt_up_time:J

    invoke-virtual {v6, v11, v12}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    float-to-int v4, v14

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v15, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 165
    :cond_c
    iget v4, v1, Lcom/flyersoft/components/MyShakeSensorListener;->tilt_down:F

    const/high16 v6, 0x40000000    # 2.0f

    const/4 v11, 0x0

    cmpl-float v7, v4, v11

    if-eqz v7, :cond_d

    div-float/2addr v4, v6

    cmpg-float v4, v3, v4

    if-ltz v4, :cond_e

    :cond_d
    iget v4, v1, Lcom/flyersoft/components/MyShakeSensorListener;->tilt_up:F

    cmpl-float v7, v4, v11

    if-eqz v7, :cond_f

    neg-float v4, v4

    div-float/2addr v4, v6

    cmpg-float v4, v3, v4

    if-gez v4, :cond_f

    float-to-double v3, v3

    const-wide v6, 0x3fe999999999999aL    # 0.8

    cmpg-double v11, v3, v6

    if-gez v11, :cond_f

    .line 167
    :cond_e
    iput-wide v8, v1, Lcom/flyersoft/components/MyShakeSensorListener;->tilt_center_time:J

    .line 168
    new-instance v3, Ljava/lang/StringBuilder;

    move-object/from16 v4, v17

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-wide v6, v1, Lcom/flyersoft/components/MyShakeSensorListener;->tilt_center_time:J

    invoke-virtual {v3, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    float-to-int v0, v14

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v15, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 170
    :cond_f
    iget v0, v1, Lcom/flyersoft/components/MyShakeSensorListener;->tilt_down:F

    const/16 v2, 0x3e8

    const/4 v11, 0x0

    cmpl-float v0, v0, v11

    if-eqz v0, :cond_11

    .line 171
    iget-wide v3, v1, Lcom/flyersoft/components/MyShakeSensorListener;->tilt_center_time:J

    iget-wide v5, v1, Lcom/flyersoft/components/MyShakeSensorListener;->tilt_down_time:J

    cmp-long v0, v3, v5

    if-lez v0, :cond_10

    sub-long/2addr v3, v5

    int-to-long v11, v2

    cmp-long v0, v3, v11

    if-gez v0, :cond_10

    .line 172
    new-instance v0, Ljava/lang/StringBuilder;

    move-object/from16 v3, v16

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v3, v1, Lcom/flyersoft/components/MyShakeSensorListener;->tilt_down:F

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v15, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 173
    sget v0, Lcom/flyersoft/tools/A;->tilt_forward:I

    invoke-direct {v1, v0}, Lcom/flyersoft/components/MyShakeSensorListener;->doTiltEvent(I)V

    .line 175
    iput-wide v8, v1, Lcom/flyersoft/components/MyShakeSensorListener;->tilt_action_time:J

    const/4 v11, 0x0

    .line 176
    iput v11, v1, Lcom/flyersoft/components/MyShakeSensorListener;->tilt_up:F

    iput v11, v1, Lcom/flyersoft/components/MyShakeSensorListener;->tilt_down:F

    goto :goto_5

    :cond_10
    sub-long v3, v8, v5

    int-to-long v5, v2

    cmp-long v0, v3, v5

    if-ltz v0, :cond_11

    const/4 v11, 0x0

    .line 178
    iput v11, v1, Lcom/flyersoft/components/MyShakeSensorListener;->tilt_down:F

    .line 180
    :cond_11
    :goto_5
    iget v0, v1, Lcom/flyersoft/components/MyShakeSensorListener;->tilt_up:F

    const/4 v11, 0x0

    cmpl-float v0, v0, v11

    if-eqz v0, :cond_13

    .line 181
    iget-wide v3, v1, Lcom/flyersoft/components/MyShakeSensorListener;->tilt_center_time:J

    iget-wide v5, v1, Lcom/flyersoft/components/MyShakeSensorListener;->tilt_up_time:J

    cmp-long v0, v3, v5

    if-lez v0, :cond_12

    sub-long/2addr v3, v5

    int-to-long v11, v2

    cmp-long v0, v3, v11

    if-gez v0, :cond_12

    .line 182
    new-instance v0, Ljava/lang/StringBuilder;

    move-object/from16 v2, v22

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v2, v1, Lcom/flyersoft/components/MyShakeSensorListener;->tilt_up:F

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v15, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 183
    sget v0, Lcom/flyersoft/tools/A;->tilt_backward:I

    invoke-direct {v1, v0}, Lcom/flyersoft/components/MyShakeSensorListener;->doTiltEvent(I)V

    .line 185
    iput-wide v8, v1, Lcom/flyersoft/components/MyShakeSensorListener;->tilt_action_time:J

    const/4 v11, 0x0

    .line 186
    iput v11, v1, Lcom/flyersoft/components/MyShakeSensorListener;->tilt_up:F

    iput v11, v1, Lcom/flyersoft/components/MyShakeSensorListener;->tilt_down:F

    goto :goto_6

    :cond_12
    sub-long/2addr v8, v5

    int-to-long v2, v2

    cmp-long v0, v8, v2

    if-ltz v0, :cond_13

    const/4 v11, 0x0

    .line 188
    iput v11, v1, Lcom/flyersoft/components/MyShakeSensorListener;->tilt_up:F
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 192
    :cond_13
    :goto_6
    iput v10, v1, Lcom/flyersoft/components/MyShakeSensorListener;->tilt_x:F

    move/from16 v2, v18

    .line 193
    :goto_7
    iput v2, v1, Lcom/flyersoft/components/MyShakeSensorListener;->tilt_y:F

    goto/16 :goto_1

    :catchall_0
    move-exception v0

    move/from16 v2, v18

    goto :goto_9

    :cond_14
    :goto_8
    move v2, v12

    const/4 v0, 0x0

    .line 126
    :try_start_5
    iput v0, v1, Lcom/flyersoft/components/MyShakeSensorListener;->tilt_hold_count:I

    const v0, 0x461c4000    # 10000.0f

    .line 127
    iput v0, v1, Lcom/flyersoft/components/MyShakeSensorListener;->tilt_base_z:F
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 192
    iput v10, v1, Lcom/flyersoft/components/MyShakeSensorListener;->tilt_x:F

    goto :goto_7

    :catchall_1
    move-exception v0

    goto :goto_9

    :catchall_2
    move-exception v0

    move v2, v12

    :goto_9
    iput v10, v1, Lcom/flyersoft/components/MyShakeSensorListener;->tilt_x:F

    .line 193
    iput v2, v1, Lcom/flyersoft/components/MyShakeSensorListener;->tilt_y:F

    .line 194
    iput v14, v1, Lcom/flyersoft/components/MyShakeSensorListener;->tilt_z:F

    .line 195
    throw v0
.end method

.method private getSensivityValue(F)F
    .locals 1

    const/4 v0, 0x0

    cmpl-float p1, p1, v0

    if-lez p1, :cond_0

    .line 212
    sget p1, Lcom/flyersoft/tools/A;->tilt_forward_sensitive:F

    return p1

    :cond_0
    sget p1, Lcom/flyersoft/tools/A;->tilt_backward_sensitive:F

    return p1
.end method


# virtual methods
.method public onAccuracyChanged(Landroid/hardware/Sensor;I)V
    .locals 0

    return-void
.end method

.method public onSensorChanged(Landroid/hardware/SensorEvent;)V
    .locals 17

    move-object/from16 v1, p0

    move-object/from16 v0, p1

    .line 27
    :try_start_0
    sget-object v2, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    if-eqz v2, :cond_e

    .line 28
    invoke-virtual {v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->isFinishing()Z

    move-result v3

    if-eqz v3, :cond_0

    goto/16 :goto_1

    .line 30
    :cond_0
    sget v3, Lcom/flyersoft/tools/A;->doShakePhone:I

    const/16 v4, 0xf

    if-ne v3, v4, :cond_1

    iget-boolean v3, v1, Lcom/flyersoft/components/MyShakeSensorListener;->tilt_turn_page:Z

    if-nez v3, :cond_1

    goto/16 :goto_1

    .line 33
    :cond_1
    iget-boolean v3, v1, Lcom/flyersoft/components/MyShakeSensorListener;->tilt_turn_page:Z

    if-eqz v3, :cond_2

    sget-object v3, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-boolean v3, v3, Lcom/flyersoft/moonreaderp/ActivityTxt;->isPaused:Z

    if-nez v3, :cond_2

    sget-boolean v3, Lcom/flyersoft/tools/A;->isSpeaking:Z

    if-nez v3, :cond_2

    sget-boolean v3, Lcom/flyersoft/tools/A;->isInAutoScroll:Z

    if-nez v3, :cond_2

    .line 34
    invoke-direct/range {p0 .. p1}, Lcom/flyersoft/components/MyShakeSensorListener;->do_tilt_event(Landroid/hardware/SensorEvent;)V

    .line 37
    :cond_2
    sget-object v3, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-boolean v3, v3, Lcom/flyersoft/moonreaderp/ActivityTxt;->isPaused:Z

    const/16 v4, 0x13

    if-eqz v3, :cond_3

    sget v3, Lcom/flyersoft/tools/A;->doShakePhone:I

    if-eq v3, v4, :cond_3

    goto/16 :goto_1

    .line 40
    :cond_3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    .line 41
    iget-wide v7, v1, Lcom/flyersoft/components/MyShakeSensorListener;->lastSensorUpdate:J

    sub-long v9, v5, v7

    const-wide/16 v11, 0x3c

    cmp-long v3, v9, v11

    if-lez v3, :cond_e

    sub-long v7, v5, v7

    const-wide/16 v9, 0x0

    cmp-long v3, v7, v9

    if-nez v3, :cond_4

    const-wide/16 v7, 0x1

    .line 45
    :cond_4
    iput-wide v5, v1, Lcom/flyersoft/components/MyShakeSensorListener;->lastSensorUpdate:J

    .line 46
    iget-wide v9, v1, Lcom/flyersoft/components/MyShakeSensorListener;->speedTime1:J

    const-wide/16 v11, -0x1

    cmp-long v3, v9, v11

    if-eqz v3, :cond_5

    sub-long v9, v5, v9

    const-wide/16 v13, 0x1f4

    cmp-long v3, v9, v13

    if-lez v3, :cond_5

    .line 47
    iput-wide v11, v1, Lcom/flyersoft/components/MyShakeSensorListener;->speedTime1:J

    .line 49
    :cond_5
    iget-object v3, v0, Landroid/hardware/SensorEvent;->values:[F

    const/4 v9, 0x0

    aget v3, v3, v9

    .line 50
    iget-object v9, v0, Landroid/hardware/SensorEvent;->values:[F

    const/4 v10, 0x1

    aget v9, v9, v10

    .line 51
    iget-object v0, v0, Landroid/hardware/SensorEvent;->values:[F

    const/4 v10, 0x2

    aget v0, v0, v10

    .line 52
    iget v10, v1, Lcom/flyersoft/components/MyShakeSensorListener;->last_sx:F

    const/high16 v13, -0x40800000    # -1.0f

    cmpl-float v13, v10, v13

    if-nez v13, :cond_6

    .line 53
    iput v3, v1, Lcom/flyersoft/components/MyShakeSensorListener;->last_sx:F

    .line 54
    iput v9, v1, Lcom/flyersoft/components/MyShakeSensorListener;->last_sy:F

    .line 55
    iput v0, v1, Lcom/flyersoft/components/MyShakeSensorListener;->last_sz:F

    return-void

    :cond_6
    add-float v13, v3, v9

    add-float/2addr v13, v0

    sub-float/2addr v13, v10

    .line 59
    iget v10, v1, Lcom/flyersoft/components/MyShakeSensorListener;->last_sy:F

    sub-float/2addr v13, v10

    iget v10, v1, Lcom/flyersoft/components/MyShakeSensorListener;->last_sz:F

    sub-float/2addr v13, v10

    long-to-float v7, v7

    div-float/2addr v13, v7

    const v7, 0x461c4000    # 10000.0f

    mul-float v13, v13, v7

    float-to-int v7, v13

    .line 60
    invoke-static {v7}, Ljava/lang/Math;->abs(I)I

    move-result v7

    .line 61
    iget v8, v1, Lcom/flyersoft/components/MyShakeSensorListener;->last_sx:F

    sub-float v8, v3, v8

    float-to-int v8, v8

    .line 62
    iget v10, v1, Lcom/flyersoft/components/MyShakeSensorListener;->last_sy:F

    sub-float v10, v9, v10

    float-to-int v10, v10

    .line 63
    sget v13, Lcom/flyersoft/tools/A;->shake_sensitive:F

    .line 65
    invoke-static {v8}, Ljava/lang/Math;->abs(I)I

    move-result v14

    int-to-float v14, v14

    cmpl-float v14, v14, v13

    if-gtz v14, :cond_7

    invoke-static {v10}, Ljava/lang/Math;->abs(I)I

    move-result v14

    int-to-float v14, v14

    cmpl-float v14, v14, v13

    if-lez v14, :cond_d

    :cond_7
    int-to-float v7, v7

    const/high16 v14, 0x40e00000    # 7.0f

    mul-float v14, v14, v13

    cmpl-float v14, v7, v14

    if-gtz v14, :cond_8

    iget-wide v14, v1, Lcom/flyersoft/components/MyShakeSensorListener;->speedTime1:J

    cmp-long v16, v14, v11

    if-eqz v16, :cond_d

    const/high16 v14, 0x40a00000    # 5.0f

    mul-float v14, v14, v13

    cmpl-float v7, v7, v14

    if-lez v7, :cond_d

    .line 67
    :cond_8
    iget-wide v14, v1, Lcom/flyersoft/components/MyShakeSensorListener;->speedTime1:J

    cmp-long v7, v14, v11

    if-nez v7, :cond_9

    .line 68
    iput-wide v5, v1, Lcom/flyersoft/components/MyShakeSensorListener;->speedTime1:J

    int-to-float v2, v8

    .line 69
    iput v2, v1, Lcom/flyersoft/components/MyShakeSensorListener;->sx_move1:F

    goto :goto_0

    .line 70
    :cond_9
    iget v5, v1, Lcom/flyersoft/components/MyShakeSensorListener;->sx_move1:F

    const/4 v6, 0x0

    cmpg-float v7, v5, v6

    if-gez v7, :cond_a

    int-to-float v7, v8

    cmpl-float v7, v7, v13

    if-gtz v7, :cond_b

    int-to-float v7, v10

    cmpl-float v7, v7, v13

    if-gtz v7, :cond_b

    :cond_a
    cmpl-float v5, v5, v6

    if-lez v5, :cond_d

    int-to-float v5, v8

    neg-float v6, v13

    cmpg-float v5, v5, v6

    if-ltz v5, :cond_b

    int-to-float v5, v10

    cmpg-float v5, v5, v6

    if-gez v5, :cond_d

    .line 72
    :cond_b
    iget-boolean v5, v2, Lcom/flyersoft/moonreaderp/ActivityTxt;->isPaused:Z

    if-eqz v5, :cond_c

    sget v5, Lcom/flyersoft/tools/A;->doShakePhone:I

    if-ne v5, v4, :cond_c

    .line 73
    sget-boolean v4, Lcom/flyersoft/tools/A;->isSpeaking:Z

    if-eqz v4, :cond_d

    .line 74
    invoke-virtual {v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->stop_speak()V

    .line 75
    invoke-virtual {v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->unregisterShakeSensor()V

    goto :goto_0

    .line 78
    :cond_c
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v4

    iget-wide v6, v1, Lcom/flyersoft/components/MyShakeSensorListener;->lastShakeTime:J

    sub-long/2addr v4, v6

    const-wide/16 v6, 0x7d0

    cmp-long v8, v4, v6

    if-lez v8, :cond_d

    .line 79
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v4

    iput-wide v4, v1, Lcom/flyersoft/components/MyShakeSensorListener;->lastShakeTime:J

    .line 80
    sget v4, Lcom/flyersoft/tools/A;->doShakePhone:I

    invoke-virtual {v2, v4}, Lcom/flyersoft/moonreaderp/ActivityTxt;->doEvent(I)Z

    .line 86
    :cond_d
    :goto_0
    iput v3, v1, Lcom/flyersoft/components/MyShakeSensorListener;->last_sx:F

    .line 87
    iput v9, v1, Lcom/flyersoft/components/MyShakeSensorListener;->last_sy:F

    .line 88
    iput v0, v1, Lcom/flyersoft/components/MyShakeSensorListener;->last_sz:F
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 92
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_e
    :goto_1
    return-void
.end method
