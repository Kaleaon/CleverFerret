.class public final enum Lio/opencensus/trace/Span$Kind;
.super Ljava/lang/Enum;
.source "Span.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/opencensus/trace/Span;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Kind"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lio/opencensus/trace/Span$Kind;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lio/opencensus/trace/Span$Kind;

.field public static final enum CLIENT:Lio/opencensus/trace/Span$Kind;

.field public static final enum SERVER:Lio/opencensus/trace/Span$Kind;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 279
    new-instance v0, Lio/opencensus/trace/Span$Kind;

    const-string v1, "SERVER"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lio/opencensus/trace/Span$Kind;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lio/opencensus/trace/Span$Kind;->SERVER:Lio/opencensus/trace/Span$Kind;

    .line 286
    new-instance v1, Lio/opencensus/trace/Span$Kind;

    const-string v3, "CLIENT"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lio/opencensus/trace/Span$Kind;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lio/opencensus/trace/Span$Kind;->CLIENT:Lio/opencensus/trace/Span$Kind;

    const/4 v3, 0x2

    .line 273
    new-array v3, v3, [Lio/opencensus/trace/Span$Kind;

    aput-object v0, v3, v2

    aput-object v1, v3, v4

    sput-object v3, Lio/opencensus/trace/Span$Kind;->$VALUES:[Lio/opencensus/trace/Span$Kind;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 273
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lio/opencensus/trace/Span$Kind;
    .locals 1

    .line 273
    const-class v0, Lio/opencensus/trace/Span$Kind;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lio/opencensus/trace/Span$Kind;

    return-object p0
.end method

.method public static values()[Lio/opencensus/trace/Span$Kind;
    .locals 1

    .line 273
    sget-object v0, Lio/opencensus/trace/Span$Kind;->$VALUES:[Lio/opencensus/trace/Span$Kind;

    invoke-virtual {v0}, [Lio/opencensus/trace/Span$Kind;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/opencensus/trace/Span$Kind;

    return-object v0
.end method
