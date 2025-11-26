.class public final enum Lio/opencensus/trace/Status$CanonicalCode;
.super Ljava/lang/Enum;
.source "Status.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/opencensus/trace/Status;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "CanonicalCode"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lio/opencensus/trace/Status$CanonicalCode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lio/opencensus/trace/Status$CanonicalCode;

.field public static final enum ABORTED:Lio/opencensus/trace/Status$CanonicalCode;

.field public static final enum ALREADY_EXISTS:Lio/opencensus/trace/Status$CanonicalCode;

.field public static final enum CANCELLED:Lio/opencensus/trace/Status$CanonicalCode;

.field public static final enum DATA_LOSS:Lio/opencensus/trace/Status$CanonicalCode;

.field public static final enum DEADLINE_EXCEEDED:Lio/opencensus/trace/Status$CanonicalCode;

.field public static final enum FAILED_PRECONDITION:Lio/opencensus/trace/Status$CanonicalCode;

.field public static final enum INTERNAL:Lio/opencensus/trace/Status$CanonicalCode;

.field public static final enum INVALID_ARGUMENT:Lio/opencensus/trace/Status$CanonicalCode;

.field public static final enum NOT_FOUND:Lio/opencensus/trace/Status$CanonicalCode;

.field public static final enum OK:Lio/opencensus/trace/Status$CanonicalCode;

.field public static final enum OUT_OF_RANGE:Lio/opencensus/trace/Status$CanonicalCode;

.field public static final enum PERMISSION_DENIED:Lio/opencensus/trace/Status$CanonicalCode;

.field public static final enum RESOURCE_EXHAUSTED:Lio/opencensus/trace/Status$CanonicalCode;

.field public static final enum UNAUTHENTICATED:Lio/opencensus/trace/Status$CanonicalCode;

.field public static final enum UNAVAILABLE:Lio/opencensus/trace/Status$CanonicalCode;

.field public static final enum UNIMPLEMENTED:Lio/opencensus/trace/Status$CanonicalCode;

.field public static final enum UNKNOWN:Lio/opencensus/trace/Status$CanonicalCode;


# instance fields
.field private final value:I


# direct methods
.method static constructor <clinit>()V
    .locals 35

    .line 55
    new-instance v0, Lio/opencensus/trace/Status$CanonicalCode;

    const-string v1, "OK"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lio/opencensus/trace/Status$CanonicalCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/opencensus/trace/Status$CanonicalCode;->OK:Lio/opencensus/trace/Status$CanonicalCode;

    .line 62
    new-instance v1, Lio/opencensus/trace/Status$CanonicalCode;

    const-string v3, "CANCELLED"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4, v4}, Lio/opencensus/trace/Status$CanonicalCode;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lio/opencensus/trace/Status$CanonicalCode;->CANCELLED:Lio/opencensus/trace/Status$CanonicalCode;

    .line 72
    new-instance v3, Lio/opencensus/trace/Status$CanonicalCode;

    const-string v5, "UNKNOWN"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6, v6}, Lio/opencensus/trace/Status$CanonicalCode;-><init>(Ljava/lang/String;II)V

    sput-object v3, Lio/opencensus/trace/Status$CanonicalCode;->UNKNOWN:Lio/opencensus/trace/Status$CanonicalCode;

    .line 81
    new-instance v5, Lio/opencensus/trace/Status$CanonicalCode;

    const-string v7, "INVALID_ARGUMENT"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8, v8}, Lio/opencensus/trace/Status$CanonicalCode;-><init>(Ljava/lang/String;II)V

    sput-object v5, Lio/opencensus/trace/Status$CanonicalCode;->INVALID_ARGUMENT:Lio/opencensus/trace/Status$CanonicalCode;

    .line 91
    new-instance v7, Lio/opencensus/trace/Status$CanonicalCode;

    const-string v9, "DEADLINE_EXCEEDED"

    const/4 v10, 0x4

    invoke-direct {v7, v9, v10, v10}, Lio/opencensus/trace/Status$CanonicalCode;-><init>(Ljava/lang/String;II)V

    sput-object v7, Lio/opencensus/trace/Status$CanonicalCode;->DEADLINE_EXCEEDED:Lio/opencensus/trace/Status$CanonicalCode;

    .line 98
    new-instance v9, Lio/opencensus/trace/Status$CanonicalCode;

    const-string v11, "NOT_FOUND"

    const/4 v12, 0x5

    invoke-direct {v9, v11, v12, v12}, Lio/opencensus/trace/Status$CanonicalCode;-><init>(Ljava/lang/String;II)V

    sput-object v9, Lio/opencensus/trace/Status$CanonicalCode;->NOT_FOUND:Lio/opencensus/trace/Status$CanonicalCode;

    .line 105
    new-instance v11, Lio/opencensus/trace/Status$CanonicalCode;

    const-string v13, "ALREADY_EXISTS"

    const/4 v14, 0x6

    invoke-direct {v11, v13, v14, v14}, Lio/opencensus/trace/Status$CanonicalCode;-><init>(Ljava/lang/String;II)V

    sput-object v11, Lio/opencensus/trace/Status$CanonicalCode;->ALREADY_EXISTS:Lio/opencensus/trace/Status$CanonicalCode;

    .line 115
    new-instance v13, Lio/opencensus/trace/Status$CanonicalCode;

    const-string v15, "PERMISSION_DENIED"

    const/16 v16, 0x0

    const/4 v2, 0x7

    invoke-direct {v13, v15, v2, v2}, Lio/opencensus/trace/Status$CanonicalCode;-><init>(Ljava/lang/String;II)V

    sput-object v13, Lio/opencensus/trace/Status$CanonicalCode;->PERMISSION_DENIED:Lio/opencensus/trace/Status$CanonicalCode;

    .line 123
    new-instance v15, Lio/opencensus/trace/Status$CanonicalCode;

    const/16 v17, 0x7

    const-string v2, "RESOURCE_EXHAUSTED"

    const/16 v18, 0x1

    const/16 v4, 0x8

    invoke-direct {v15, v2, v4, v4}, Lio/opencensus/trace/Status$CanonicalCode;-><init>(Ljava/lang/String;II)V

    sput-object v15, Lio/opencensus/trace/Status$CanonicalCode;->RESOURCE_EXHAUSTED:Lio/opencensus/trace/Status$CanonicalCode;

    .line 140
    new-instance v2, Lio/opencensus/trace/Status$CanonicalCode;

    const/16 v19, 0x8

    const-string v4, "FAILED_PRECONDITION"

    const/16 v20, 0x2

    const/16 v6, 0x9

    invoke-direct {v2, v4, v6, v6}, Lio/opencensus/trace/Status$CanonicalCode;-><init>(Ljava/lang/String;II)V

    sput-object v2, Lio/opencensus/trace/Status$CanonicalCode;->FAILED_PRECONDITION:Lio/opencensus/trace/Status$CanonicalCode;

    .line 150
    new-instance v4, Lio/opencensus/trace/Status$CanonicalCode;

    const/16 v21, 0x9

    const-string v6, "ABORTED"

    const/16 v22, 0x3

    const/16 v8, 0xa

    invoke-direct {v4, v6, v8, v8}, Lio/opencensus/trace/Status$CanonicalCode;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lio/opencensus/trace/Status$CanonicalCode;->ABORTED:Lio/opencensus/trace/Status$CanonicalCode;

    .line 167
    new-instance v6, Lio/opencensus/trace/Status$CanonicalCode;

    const/16 v23, 0xa

    const-string v8, "OUT_OF_RANGE"

    const/16 v24, 0x4

    const/16 v10, 0xb

    invoke-direct {v6, v8, v10, v10}, Lio/opencensus/trace/Status$CanonicalCode;-><init>(Ljava/lang/String;II)V

    sput-object v6, Lio/opencensus/trace/Status$CanonicalCode;->OUT_OF_RANGE:Lio/opencensus/trace/Status$CanonicalCode;

    .line 174
    new-instance v8, Lio/opencensus/trace/Status$CanonicalCode;

    const/16 v25, 0xb

    const-string v10, "UNIMPLEMENTED"

    const/16 v26, 0x5

    const/16 v12, 0xc

    invoke-direct {v8, v10, v12, v12}, Lio/opencensus/trace/Status$CanonicalCode;-><init>(Ljava/lang/String;II)V

    sput-object v8, Lio/opencensus/trace/Status$CanonicalCode;->UNIMPLEMENTED:Lio/opencensus/trace/Status$CanonicalCode;

    .line 182
    new-instance v10, Lio/opencensus/trace/Status$CanonicalCode;

    const/16 v27, 0xc

    const-string v12, "INTERNAL"

    const/16 v28, 0x6

    const/16 v14, 0xd

    invoke-direct {v10, v12, v14, v14}, Lio/opencensus/trace/Status$CanonicalCode;-><init>(Ljava/lang/String;II)V

    sput-object v10, Lio/opencensus/trace/Status$CanonicalCode;->INTERNAL:Lio/opencensus/trace/Status$CanonicalCode;

    .line 192
    new-instance v12, Lio/opencensus/trace/Status$CanonicalCode;

    const/16 v29, 0xd

    const-string v14, "UNAVAILABLE"

    move-object/from16 v30, v0

    const/16 v0, 0xe

    invoke-direct {v12, v14, v0, v0}, Lio/opencensus/trace/Status$CanonicalCode;-><init>(Ljava/lang/String;II)V

    sput-object v12, Lio/opencensus/trace/Status$CanonicalCode;->UNAVAILABLE:Lio/opencensus/trace/Status$CanonicalCode;

    .line 199
    new-instance v14, Lio/opencensus/trace/Status$CanonicalCode;

    const/16 v31, 0xe

    const-string v0, "DATA_LOSS"

    move-object/from16 v32, v1

    const/16 v1, 0xf

    invoke-direct {v14, v0, v1, v1}, Lio/opencensus/trace/Status$CanonicalCode;-><init>(Ljava/lang/String;II)V

    sput-object v14, Lio/opencensus/trace/Status$CanonicalCode;->DATA_LOSS:Lio/opencensus/trace/Status$CanonicalCode;

    .line 206
    new-instance v0, Lio/opencensus/trace/Status$CanonicalCode;

    const/16 v33, 0xf

    const-string v1, "UNAUTHENTICATED"

    move-object/from16 v34, v2

    const/16 v2, 0x10

    invoke-direct {v0, v1, v2, v2}, Lio/opencensus/trace/Status$CanonicalCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/opencensus/trace/Status$CanonicalCode;->UNAUTHENTICATED:Lio/opencensus/trace/Status$CanonicalCode;

    const/16 v1, 0x11

    .line 49
    new-array v1, v1, [Lio/opencensus/trace/Status$CanonicalCode;

    aput-object v30, v1, v16

    aput-object v32, v1, v18

    aput-object v3, v1, v20

    aput-object v5, v1, v22

    aput-object v7, v1, v24

    aput-object v9, v1, v26

    aput-object v11, v1, v28

    aput-object v13, v1, v17

    aput-object v15, v1, v19

    aput-object v34, v1, v21

    aput-object v4, v1, v23

    aput-object v6, v1, v25

    aput-object v8, v1, v27

    aput-object v10, v1, v29

    aput-object v12, v1, v31

    aput-object v14, v1, v33

    aput-object v0, v1, v2

    sput-object v1, Lio/opencensus/trace/Status$CanonicalCode;->$VALUES:[Lio/opencensus/trace/Status$CanonicalCode;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 210
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 211
    iput p3, p0, Lio/opencensus/trace/Status$CanonicalCode;->value:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lio/opencensus/trace/Status$CanonicalCode;
    .locals 1

    .line 49
    const-class v0, Lio/opencensus/trace/Status$CanonicalCode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lio/opencensus/trace/Status$CanonicalCode;

    return-object p0
.end method

.method public static values()[Lio/opencensus/trace/Status$CanonicalCode;
    .locals 1

    .line 49
    sget-object v0, Lio/opencensus/trace/Status$CanonicalCode;->$VALUES:[Lio/opencensus/trace/Status$CanonicalCode;

    invoke-virtual {v0}, [Lio/opencensus/trace/Status$CanonicalCode;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/opencensus/trace/Status$CanonicalCode;

    return-object v0
.end method


# virtual methods
.method public toStatus()Lio/opencensus/trace/Status;
    .locals 2

    .line 231
    invoke-static {}, Lio/opencensus/trace/Status;->access$000()Ljava/util/List;

    move-result-object v0

    iget v1, p0, Lio/opencensus/trace/Status$CanonicalCode;->value:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/opencensus/trace/Status;

    return-object v0
.end method

.method public value()I
    .locals 1

    .line 221
    iget v0, p0, Lio/opencensus/trace/Status$CanonicalCode;->value:I

    return v0
.end method
