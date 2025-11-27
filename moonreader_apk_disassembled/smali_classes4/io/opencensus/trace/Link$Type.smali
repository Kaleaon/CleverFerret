.class public final enum Lio/opencensus/trace/Link$Type;
.super Ljava/lang/Enum;
.source "Link.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/opencensus/trace/Link;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Type"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lio/opencensus/trace/Link$Type;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lio/opencensus/trace/Link$Type;

.field public static final enum CHILD_LINKED_SPAN:Lio/opencensus/trace/Link$Type;

.field public static final enum PARENT_LINKED_SPAN:Lio/opencensus/trace/Link$Type;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 52
    new-instance v0, Lio/opencensus/trace/Link$Type;

    const-string v1, "CHILD_LINKED_SPAN"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lio/opencensus/trace/Link$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lio/opencensus/trace/Link$Type;->CHILD_LINKED_SPAN:Lio/opencensus/trace/Link$Type;

    .line 58
    new-instance v1, Lio/opencensus/trace/Link$Type;

    const-string v3, "PARENT_LINKED_SPAN"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lio/opencensus/trace/Link$Type;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lio/opencensus/trace/Link$Type;->PARENT_LINKED_SPAN:Lio/opencensus/trace/Link$Type;

    const/4 v3, 0x2

    .line 46
    new-array v3, v3, [Lio/opencensus/trace/Link$Type;

    aput-object v0, v3, v2

    aput-object v1, v3, v4

    sput-object v3, Lio/opencensus/trace/Link$Type;->$VALUES:[Lio/opencensus/trace/Link$Type;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 46
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lio/opencensus/trace/Link$Type;
    .locals 1

    .line 46
    const-class v0, Lio/opencensus/trace/Link$Type;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lio/opencensus/trace/Link$Type;

    return-object p0
.end method

.method public static values()[Lio/opencensus/trace/Link$Type;
    .locals 1

    .line 46
    sget-object v0, Lio/opencensus/trace/Link$Type;->$VALUES:[Lio/opencensus/trace/Link$Type;

    invoke-virtual {v0}, [Lio/opencensus/trace/Link$Type;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/opencensus/trace/Link$Type;

    return-object v0
.end method
