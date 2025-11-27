.class public final Lio/opencensus/contrib/http/util/HttpViewConstants;
.super Ljava/lang/Object;
.source "HttpViewConstants.java"


# static fields
.field static final COUNT:Lio/opencensus/stats/Aggregation;

.field public static final HTTP_CLIENT_COMPLETED_COUNT_VIEW:Lio/opencensus/stats/View;

.field public static final HTTP_CLIENT_RECEIVED_BYTES_VIEW:Lio/opencensus/stats/View;

.field public static final HTTP_CLIENT_ROUNDTRIP_LATENCY_VIEW:Lio/opencensus/stats/View;

.field public static final HTTP_CLIENT_SENT_BYTES_VIEW:Lio/opencensus/stats/View;

.field public static final HTTP_SERVER_COMPLETED_COUNT_VIEW:Lio/opencensus/stats/View;

.field public static final HTTP_SERVER_LATENCY_VIEW:Lio/opencensus/stats/View;

.field public static final HTTP_SERVER_RECEIVED_BYTES_VIEW:Lio/opencensus/stats/View;

.field public static final HTTP_SERVER_SENT_BYTES_VIEW:Lio/opencensus/stats/View;

.field static final LATENCY_DISTRIBUTION:Lio/opencensus/stats/Aggregation;

.field static final SIZE_DISTRIBUTION:Lio/opencensus/stats/Aggregation;


# direct methods
.method static constructor <clinit>()V
    .locals 53

    .line 52
    invoke-static {}, Lio/opencensus/stats/Aggregation$Count;->create()Lio/opencensus/stats/Aggregation$Count;

    move-result-object v0

    sput-object v0, Lio/opencensus/contrib/http/util/HttpViewConstants;->COUNT:Lio/opencensus/stats/Aggregation;

    const-wide/16 v1, 0x0

    .line 60
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    const-wide/high16 v2, 0x4090000000000000L    # 1024.0

    .line 61
    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    const-wide/high16 v3, 0x40a0000000000000L    # 2048.0

    .line 62
    invoke-static {v3, v4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    const-wide/high16 v4, 0x40b0000000000000L    # 4096.0

    .line 63
    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v4

    const-wide/high16 v5, 0x40d0000000000000L    # 16384.0

    .line 64
    invoke-static {v5, v6}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v5

    const-wide/high16 v6, 0x40f0000000000000L    # 65536.0

    .line 65
    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v6

    const-wide/high16 v7, 0x4110000000000000L    # 262144.0

    .line 66
    invoke-static {v7, v8}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v7

    const-wide/high16 v8, 0x4130000000000000L    # 1048576.0

    .line 67
    invoke-static {v8, v9}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v8

    const-wide/high16 v9, 0x4150000000000000L    # 4194304.0

    .line 68
    invoke-static {v9, v10}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v9

    const-wide/high16 v10, 0x4170000000000000L    # 1.6777216E7

    .line 69
    invoke-static {v10, v11}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v10

    const-wide/high16 v11, 0x4190000000000000L    # 6.7108864E7

    .line 70
    invoke-static {v11, v12}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v11

    const-wide/high16 v12, 0x41b0000000000000L    # 2.68435456E8

    .line 71
    invoke-static {v12, v13}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v12

    const-wide/high16 v13, 0x41d0000000000000L    # 1.073741824E9

    .line 72
    invoke-static {v13, v14}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v13

    const-wide/high16 v14, 0x41f0000000000000L    # 4.294967296E9

    .line 73
    invoke-static {v14, v15}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v14

    const/16 v15, 0xe

    move-object/from16 v16, v1

    new-array v1, v15, [Ljava/lang/Double;

    const/16 v17, 0x0

    aput-object v16, v1, v17

    const/16 v18, 0x1

    aput-object v2, v1, v18

    const/4 v2, 0x2

    aput-object v3, v1, v2

    const/4 v3, 0x3

    aput-object v4, v1, v3

    const/4 v4, 0x4

    aput-object v5, v1, v4

    const/4 v5, 0x5

    aput-object v6, v1, v5

    const/4 v6, 0x6

    aput-object v7, v1, v6

    const/4 v7, 0x7

    aput-object v8, v1, v7

    const/16 v8, 0x8

    aput-object v9, v1, v8

    const/16 v9, 0x9

    aput-object v10, v1, v9

    const/16 v10, 0xa

    aput-object v11, v1, v10

    const/16 v11, 0xb

    aput-object v12, v1, v11

    const/16 v12, 0xc

    aput-object v13, v1, v12

    const/16 v13, 0xd

    aput-object v14, v1, v13

    .line 59
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    .line 58
    invoke-static {v1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    .line 57
    invoke-static {v1}, Lio/opencensus/stats/BucketBoundaries;->create(Ljava/util/List;)Lio/opencensus/stats/BucketBoundaries;

    move-result-object v1

    .line 56
    invoke-static {v1}, Lio/opencensus/stats/Aggregation$Distribution;->create(Lio/opencensus/stats/BucketBoundaries;)Lio/opencensus/stats/Aggregation$Distribution;

    move-result-object v1

    sput-object v1, Lio/opencensus/contrib/http/util/HttpViewConstants;->SIZE_DISTRIBUTION:Lio/opencensus/stats/Aggregation;

    const-wide/high16 v19, 0x3ff0000000000000L    # 1.0

    .line 81
    invoke-static/range {v19 .. v20}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v14

    const-wide/high16 v19, 0x4000000000000000L    # 2.0

    invoke-static/range {v19 .. v20}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v19

    const-wide/high16 v20, 0x4008000000000000L    # 3.0

    invoke-static/range {v20 .. v21}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v20

    const-wide/high16 v21, 0x4010000000000000L    # 4.0

    invoke-static/range {v21 .. v22}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v21

    const-wide/high16 v22, 0x4014000000000000L    # 5.0

    invoke-static/range {v22 .. v23}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v22

    const-wide/high16 v23, 0x4018000000000000L    # 6.0

    invoke-static/range {v23 .. v24}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v23

    const-wide/high16 v24, 0x4020000000000000L    # 8.0

    invoke-static/range {v24 .. v25}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v24

    const-wide/high16 v25, 0x4024000000000000L    # 10.0

    invoke-static/range {v25 .. v26}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v25

    const-wide/high16 v26, 0x402a000000000000L    # 13.0

    invoke-static/range {v26 .. v27}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v26

    const-wide/high16 v27, 0x4030000000000000L    # 16.0

    invoke-static/range {v27 .. v28}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v27

    const-wide/high16 v28, 0x4034000000000000L    # 20.0

    invoke-static/range {v28 .. v29}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v28

    const-wide/high16 v29, 0x4039000000000000L    # 25.0

    invoke-static/range {v29 .. v30}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v29

    const-wide/high16 v30, 0x403e000000000000L    # 30.0

    invoke-static/range {v30 .. v31}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v30

    const-wide/high16 v31, 0x4044000000000000L    # 40.0

    .line 82
    invoke-static/range {v31 .. v32}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v31

    const-wide/high16 v32, 0x4049000000000000L    # 50.0

    invoke-static/range {v32 .. v33}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v32

    const-wide v33, 0x4050400000000000L    # 65.0

    invoke-static/range {v33 .. v34}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v33

    const-wide/high16 v34, 0x4054000000000000L    # 80.0

    invoke-static/range {v34 .. v35}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v34

    const-wide/high16 v35, 0x4059000000000000L    # 100.0

    invoke-static/range {v35 .. v36}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v35

    const-wide v36, 0x4060400000000000L    # 130.0

    invoke-static/range {v36 .. v37}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v36

    const-wide/high16 v37, 0x4064000000000000L    # 160.0

    invoke-static/range {v37 .. v38}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v37

    const-wide/high16 v38, 0x4069000000000000L    # 200.0

    invoke-static/range {v38 .. v39}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v38

    const-wide v39, 0x406f400000000000L    # 250.0

    invoke-static/range {v39 .. v40}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v39

    const-wide v40, 0x4072c00000000000L    # 300.0

    invoke-static/range {v40 .. v41}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v40

    const-wide/high16 v41, 0x4079000000000000L    # 400.0

    invoke-static/range {v41 .. v42}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v41

    const-wide v42, 0x407f400000000000L    # 500.0

    .line 83
    invoke-static/range {v42 .. v43}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v42

    const-wide v43, 0x4084500000000000L    # 650.0

    invoke-static/range {v43 .. v44}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v43

    const-wide/high16 v44, 0x4089000000000000L    # 800.0

    invoke-static/range {v44 .. v45}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v44

    const-wide v45, 0x408f400000000000L    # 1000.0

    invoke-static/range {v45 .. v46}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v45

    const-wide v46, 0x409f400000000000L    # 2000.0

    invoke-static/range {v46 .. v47}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v46

    const-wide v47, 0x40b3880000000000L    # 5000.0

    invoke-static/range {v47 .. v48}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v47

    const-wide v48, 0x40c3880000000000L    # 10000.0

    invoke-static/range {v48 .. v49}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v48

    const-wide v49, 0x40d3880000000000L    # 20000.0

    invoke-static/range {v49 .. v50}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v49

    const-wide v50, 0x40e86a0000000000L    # 50000.0

    invoke-static/range {v50 .. v51}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v50

    const-wide v51, 0x40f86a0000000000L    # 100000.0

    .line 84
    invoke-static/range {v51 .. v52}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v51

    const/16 v52, 0x4

    const/16 v4, 0x23

    new-array v4, v4, [Ljava/lang/Double;

    aput-object v16, v4, v17

    aput-object v14, v4, v18

    aput-object v19, v4, v2

    aput-object v20, v4, v3

    aput-object v21, v4, v52

    aput-object v22, v4, v5

    aput-object v23, v4, v6

    aput-object v24, v4, v7

    aput-object v25, v4, v8

    aput-object v26, v4, v9

    aput-object v27, v4, v10

    aput-object v28, v4, v11

    aput-object v29, v4, v12

    aput-object v30, v4, v13

    aput-object v31, v4, v15

    const/16 v5, 0xf

    aput-object v32, v4, v5

    const/16 v5, 0x10

    aput-object v33, v4, v5

    const/16 v5, 0x11

    aput-object v34, v4, v5

    const/16 v5, 0x12

    aput-object v35, v4, v5

    const/16 v5, 0x13

    aput-object v36, v4, v5

    const/16 v5, 0x14

    aput-object v37, v4, v5

    const/16 v5, 0x15

    aput-object v38, v4, v5

    const/16 v5, 0x16

    aput-object v39, v4, v5

    const/16 v5, 0x17

    aput-object v40, v4, v5

    const/16 v5, 0x18

    aput-object v41, v4, v5

    const/16 v5, 0x19

    aput-object v42, v4, v5

    const/16 v5, 0x1a

    aput-object v43, v4, v5

    const/16 v5, 0x1b

    aput-object v44, v4, v5

    const/16 v5, 0x1c

    aput-object v45, v4, v5

    const/16 v5, 0x1d

    aput-object v46, v4, v5

    const/16 v5, 0x1e

    aput-object v47, v4, v5

    const/16 v5, 0x1f

    aput-object v48, v4, v5

    const/16 v5, 0x20

    aput-object v49, v4, v5

    const/16 v5, 0x21

    aput-object v50, v4, v5

    const/16 v5, 0x22

    aput-object v51, v4, v5

    .line 80
    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    .line 79
    invoke-static {v4}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v4

    .line 78
    invoke-static {v4}, Lio/opencensus/stats/BucketBoundaries;->create(Ljava/util/List;)Lio/opencensus/stats/BucketBoundaries;

    move-result-object v4

    .line 77
    invoke-static {v4}, Lio/opencensus/stats/Aggregation$Distribution;->create(Lio/opencensus/stats/BucketBoundaries;)Lio/opencensus/stats/Aggregation$Distribution;

    move-result-object v4

    sput-object v4, Lio/opencensus/contrib/http/util/HttpViewConstants;->LATENCY_DISTRIBUTION:Lio/opencensus/stats/Aggregation;

    .line 91
    const-string v5, "opencensus.io/http/client/completed_count"

    .line 93
    invoke-static {v5}, Lio/opencensus/stats/View$Name;->create(Ljava/lang/String;)Lio/opencensus/stats/View$Name;

    move-result-object v5

    sget-object v6, Lio/opencensus/contrib/http/util/HttpMeasureConstants;->HTTP_CLIENT_ROUNDTRIP_LATENCY:Lio/opencensus/stats/Measure$MeasureDouble;

    new-array v7, v2, [Lio/opencensus/tags/TagKey;

    sget-object v8, Lio/opencensus/contrib/http/util/HttpMeasureConstants;->HTTP_CLIENT_METHOD:Lio/opencensus/tags/TagKey;

    aput-object v8, v7, v17

    sget-object v8, Lio/opencensus/contrib/http/util/HttpMeasureConstants;->HTTP_CLIENT_STATUS:Lio/opencensus/tags/TagKey;

    aput-object v8, v7, v18

    .line 97
    invoke-static {v7}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v7

    .line 92
    const-string v8, "Count of client-side HTTP requests completed"

    invoke-static {v5, v8, v6, v0, v7}, Lio/opencensus/stats/View;->create(Lio/opencensus/stats/View$Name;Ljava/lang/String;Lio/opencensus/stats/Measure;Lio/opencensus/stats/Aggregation;Ljava/util/List;)Lio/opencensus/stats/View;

    move-result-object v5

    sput-object v5, Lio/opencensus/contrib/http/util/HttpViewConstants;->HTTP_CLIENT_COMPLETED_COUNT_VIEW:Lio/opencensus/stats/View;

    .line 104
    const-string v5, "opencensus.io/http/client/sent_bytes"

    .line 106
    invoke-static {v5}, Lio/opencensus/stats/View$Name;->create(Ljava/lang/String;)Lio/opencensus/stats/View$Name;

    move-result-object v5

    sget-object v6, Lio/opencensus/contrib/http/util/HttpMeasureConstants;->HTTP_CLIENT_SENT_BYTES:Lio/opencensus/stats/Measure$MeasureLong;

    new-array v7, v2, [Lio/opencensus/tags/TagKey;

    sget-object v8, Lio/opencensus/contrib/http/util/HttpMeasureConstants;->HTTP_CLIENT_METHOD:Lio/opencensus/tags/TagKey;

    aput-object v8, v7, v17

    sget-object v8, Lio/opencensus/contrib/http/util/HttpMeasureConstants;->HTTP_CLIENT_STATUS:Lio/opencensus/tags/TagKey;

    aput-object v8, v7, v18

    .line 110
    invoke-static {v7}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v7

    .line 105
    const-string v8, "Size distribution of client-side HTTP request body"

    invoke-static {v5, v8, v6, v1, v7}, Lio/opencensus/stats/View;->create(Lio/opencensus/stats/View$Name;Ljava/lang/String;Lio/opencensus/stats/Measure;Lio/opencensus/stats/Aggregation;Ljava/util/List;)Lio/opencensus/stats/View;

    move-result-object v5

    sput-object v5, Lio/opencensus/contrib/http/util/HttpViewConstants;->HTTP_CLIENT_SENT_BYTES_VIEW:Lio/opencensus/stats/View;

    .line 117
    const-string v5, "opencensus.io/http/client/received_bytes"

    .line 119
    invoke-static {v5}, Lio/opencensus/stats/View$Name;->create(Ljava/lang/String;)Lio/opencensus/stats/View$Name;

    move-result-object v5

    sget-object v6, Lio/opencensus/contrib/http/util/HttpMeasureConstants;->HTTP_CLIENT_RECEIVED_BYTES:Lio/opencensus/stats/Measure$MeasureLong;

    new-array v7, v2, [Lio/opencensus/tags/TagKey;

    sget-object v8, Lio/opencensus/contrib/http/util/HttpMeasureConstants;->HTTP_CLIENT_METHOD:Lio/opencensus/tags/TagKey;

    aput-object v8, v7, v17

    sget-object v8, Lio/opencensus/contrib/http/util/HttpMeasureConstants;->HTTP_CLIENT_STATUS:Lio/opencensus/tags/TagKey;

    aput-object v8, v7, v18

    .line 123
    invoke-static {v7}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v7

    .line 118
    const-string v8, "Size distribution of client-side HTTP response body"

    invoke-static {v5, v8, v6, v1, v7}, Lio/opencensus/stats/View;->create(Lio/opencensus/stats/View$Name;Ljava/lang/String;Lio/opencensus/stats/Measure;Lio/opencensus/stats/Aggregation;Ljava/util/List;)Lio/opencensus/stats/View;

    move-result-object v5

    sput-object v5, Lio/opencensus/contrib/http/util/HttpViewConstants;->HTTP_CLIENT_RECEIVED_BYTES_VIEW:Lio/opencensus/stats/View;

    .line 130
    const-string v5, "opencensus.io/http/client/roundtrip_latency"

    .line 132
    invoke-static {v5}, Lio/opencensus/stats/View$Name;->create(Ljava/lang/String;)Lio/opencensus/stats/View$Name;

    move-result-object v5

    sget-object v6, Lio/opencensus/contrib/http/util/HttpMeasureConstants;->HTTP_CLIENT_ROUNDTRIP_LATENCY:Lio/opencensus/stats/Measure$MeasureDouble;

    new-array v7, v2, [Lio/opencensus/tags/TagKey;

    sget-object v8, Lio/opencensus/contrib/http/util/HttpMeasureConstants;->HTTP_CLIENT_METHOD:Lio/opencensus/tags/TagKey;

    aput-object v8, v7, v17

    sget-object v8, Lio/opencensus/contrib/http/util/HttpMeasureConstants;->HTTP_CLIENT_STATUS:Lio/opencensus/tags/TagKey;

    aput-object v8, v7, v18

    .line 136
    invoke-static {v7}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v7

    .line 131
    const-string v8, "Roundtrip latency distribution of client-side HTTP requests"

    invoke-static {v5, v8, v6, v4, v7}, Lio/opencensus/stats/View;->create(Lio/opencensus/stats/View$Name;Ljava/lang/String;Lio/opencensus/stats/Measure;Lio/opencensus/stats/Aggregation;Ljava/util/List;)Lio/opencensus/stats/View;

    move-result-object v5

    sput-object v5, Lio/opencensus/contrib/http/util/HttpViewConstants;->HTTP_CLIENT_ROUNDTRIP_LATENCY_VIEW:Lio/opencensus/stats/View;

    .line 143
    const-string v5, "opencensus.io/http/server/completed_count"

    .line 145
    invoke-static {v5}, Lio/opencensus/stats/View$Name;->create(Ljava/lang/String;)Lio/opencensus/stats/View$Name;

    move-result-object v5

    sget-object v6, Lio/opencensus/contrib/http/util/HttpMeasureConstants;->HTTP_SERVER_LATENCY:Lio/opencensus/stats/Measure$MeasureDouble;

    new-array v7, v3, [Lio/opencensus/tags/TagKey;

    sget-object v8, Lio/opencensus/contrib/http/util/HttpMeasureConstants;->HTTP_SERVER_METHOD:Lio/opencensus/tags/TagKey;

    aput-object v8, v7, v17

    sget-object v8, Lio/opencensus/contrib/http/util/HttpMeasureConstants;->HTTP_SERVER_ROUTE:Lio/opencensus/tags/TagKey;

    aput-object v8, v7, v18

    sget-object v8, Lio/opencensus/contrib/http/util/HttpMeasureConstants;->HTTP_SERVER_STATUS:Lio/opencensus/tags/TagKey;

    aput-object v8, v7, v2

    .line 149
    invoke-static {v7}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v7

    .line 144
    const-string v8, "Count of HTTP server-side requests serving completed"

    invoke-static {v5, v8, v6, v0, v7}, Lio/opencensus/stats/View;->create(Lio/opencensus/stats/View$Name;Ljava/lang/String;Lio/opencensus/stats/Measure;Lio/opencensus/stats/Aggregation;Ljava/util/List;)Lio/opencensus/stats/View;

    move-result-object v0

    sput-object v0, Lio/opencensus/contrib/http/util/HttpViewConstants;->HTTP_SERVER_COMPLETED_COUNT_VIEW:Lio/opencensus/stats/View;

    .line 156
    const-string v0, "opencensus.io/http/server/received_bytes"

    .line 158
    invoke-static {v0}, Lio/opencensus/stats/View$Name;->create(Ljava/lang/String;)Lio/opencensus/stats/View$Name;

    move-result-object v0

    sget-object v5, Lio/opencensus/contrib/http/util/HttpMeasureConstants;->HTTP_SERVER_RECEIVED_BYTES:Lio/opencensus/stats/Measure$MeasureLong;

    new-array v6, v3, [Lio/opencensus/tags/TagKey;

    sget-object v7, Lio/opencensus/contrib/http/util/HttpMeasureConstants;->HTTP_SERVER_METHOD:Lio/opencensus/tags/TagKey;

    aput-object v7, v6, v17

    sget-object v7, Lio/opencensus/contrib/http/util/HttpMeasureConstants;->HTTP_SERVER_ROUTE:Lio/opencensus/tags/TagKey;

    aput-object v7, v6, v18

    sget-object v7, Lio/opencensus/contrib/http/util/HttpMeasureConstants;->HTTP_SERVER_STATUS:Lio/opencensus/tags/TagKey;

    aput-object v7, v6, v2

    .line 162
    invoke-static {v6}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v6

    .line 157
    const-string v7, "Size distribution of server-side HTTP request body"

    invoke-static {v0, v7, v5, v1, v6}, Lio/opencensus/stats/View;->create(Lio/opencensus/stats/View$Name;Ljava/lang/String;Lio/opencensus/stats/Measure;Lio/opencensus/stats/Aggregation;Ljava/util/List;)Lio/opencensus/stats/View;

    move-result-object v0

    sput-object v0, Lio/opencensus/contrib/http/util/HttpViewConstants;->HTTP_SERVER_RECEIVED_BYTES_VIEW:Lio/opencensus/stats/View;

    .line 169
    const-string v0, "opencensus.io/http/server/sent_bytes"

    .line 171
    invoke-static {v0}, Lio/opencensus/stats/View$Name;->create(Ljava/lang/String;)Lio/opencensus/stats/View$Name;

    move-result-object v0

    sget-object v5, Lio/opencensus/contrib/http/util/HttpMeasureConstants;->HTTP_SERVER_SENT_BYTES:Lio/opencensus/stats/Measure$MeasureLong;

    new-array v6, v3, [Lio/opencensus/tags/TagKey;

    sget-object v7, Lio/opencensus/contrib/http/util/HttpMeasureConstants;->HTTP_SERVER_METHOD:Lio/opencensus/tags/TagKey;

    aput-object v7, v6, v17

    sget-object v7, Lio/opencensus/contrib/http/util/HttpMeasureConstants;->HTTP_SERVER_ROUTE:Lio/opencensus/tags/TagKey;

    aput-object v7, v6, v18

    sget-object v7, Lio/opencensus/contrib/http/util/HttpMeasureConstants;->HTTP_SERVER_STATUS:Lio/opencensus/tags/TagKey;

    aput-object v7, v6, v2

    .line 175
    invoke-static {v6}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v6

    .line 170
    const-string v7, "Size distribution of server-side HTTP response body"

    invoke-static {v0, v7, v5, v1, v6}, Lio/opencensus/stats/View;->create(Lio/opencensus/stats/View$Name;Ljava/lang/String;Lio/opencensus/stats/Measure;Lio/opencensus/stats/Aggregation;Ljava/util/List;)Lio/opencensus/stats/View;

    move-result-object v0

    sput-object v0, Lio/opencensus/contrib/http/util/HttpViewConstants;->HTTP_SERVER_SENT_BYTES_VIEW:Lio/opencensus/stats/View;

    .line 182
    const-string v0, "opencensus.io/http/server/server_latency"

    .line 184
    invoke-static {v0}, Lio/opencensus/stats/View$Name;->create(Ljava/lang/String;)Lio/opencensus/stats/View$Name;

    move-result-object v0

    sget-object v1, Lio/opencensus/contrib/http/util/HttpMeasureConstants;->HTTP_SERVER_LATENCY:Lio/opencensus/stats/Measure$MeasureDouble;

    new-array v3, v3, [Lio/opencensus/tags/TagKey;

    sget-object v5, Lio/opencensus/contrib/http/util/HttpMeasureConstants;->HTTP_SERVER_METHOD:Lio/opencensus/tags/TagKey;

    aput-object v5, v3, v17

    sget-object v5, Lio/opencensus/contrib/http/util/HttpMeasureConstants;->HTTP_SERVER_ROUTE:Lio/opencensus/tags/TagKey;

    aput-object v5, v3, v18

    sget-object v5, Lio/opencensus/contrib/http/util/HttpMeasureConstants;->HTTP_SERVER_STATUS:Lio/opencensus/tags/TagKey;

    aput-object v5, v3, v2

    .line 188
    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    .line 183
    const-string v3, "Latency distribution of server-side HTTP requests serving"

    invoke-static {v0, v3, v1, v4, v2}, Lio/opencensus/stats/View;->create(Lio/opencensus/stats/View$Name;Ljava/lang/String;Lio/opencensus/stats/Measure;Lio/opencensus/stats/Aggregation;Ljava/util/List;)Lio/opencensus/stats/View;

    move-result-object v0

    sput-object v0, Lio/opencensus/contrib/http/util/HttpViewConstants;->HTTP_SERVER_LATENCY_VIEW:Lio/opencensus/stats/View;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
