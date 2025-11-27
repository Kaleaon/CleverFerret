.class public final enum Lio/opencensus/tags/TaggingState;
.super Ljava/lang/Enum;
.source "TaggingState.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lio/opencensus/tags/TaggingState;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lio/opencensus/tags/TaggingState;

.field public static final enum DISABLED:Lio/opencensus/tags/TaggingState;

.field public static final enum ENABLED:Lio/opencensus/tags/TaggingState;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 36
    new-instance v0, Lio/opencensus/tags/TaggingState;

    const-string v1, "ENABLED"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lio/opencensus/tags/TaggingState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lio/opencensus/tags/TaggingState;->ENABLED:Lio/opencensus/tags/TaggingState;

    .line 47
    new-instance v1, Lio/opencensus/tags/TaggingState;

    const-string v3, "DISABLED"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lio/opencensus/tags/TaggingState;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lio/opencensus/tags/TaggingState;->DISABLED:Lio/opencensus/tags/TaggingState;

    const/4 v3, 0x2

    .line 24
    new-array v3, v3, [Lio/opencensus/tags/TaggingState;

    aput-object v0, v3, v2

    aput-object v1, v3, v4

    sput-object v3, Lio/opencensus/tags/TaggingState;->$VALUES:[Lio/opencensus/tags/TaggingState;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 24
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lio/opencensus/tags/TaggingState;
    .locals 1

    .line 24
    const-class v0, Lio/opencensus/tags/TaggingState;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lio/opencensus/tags/TaggingState;

    return-object p0
.end method

.method public static values()[Lio/opencensus/tags/TaggingState;
    .locals 1

    .line 24
    sget-object v0, Lio/opencensus/tags/TaggingState;->$VALUES:[Lio/opencensus/tags/TaggingState;

    invoke-virtual {v0}, [Lio/opencensus/tags/TaggingState;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/opencensus/tags/TaggingState;

    return-object v0
.end method
