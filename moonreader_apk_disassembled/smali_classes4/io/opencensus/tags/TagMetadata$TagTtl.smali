.class public final enum Lio/opencensus/tags/TagMetadata$TagTtl;
.super Ljava/lang/Enum;
.source "TagMetadata.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/opencensus/tags/TagMetadata;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "TagTtl"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lio/opencensus/tags/TagMetadata$TagTtl;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lio/opencensus/tags/TagMetadata$TagTtl;

.field public static final enum NO_PROPAGATION:Lio/opencensus/tags/TagMetadata$TagTtl;

.field public static final enum UNLIMITED_PROPAGATION:Lio/opencensus/tags/TagMetadata$TagTtl;


# instance fields
.field private final hops:I


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 76
    new-instance v0, Lio/opencensus/tags/TagMetadata$TagTtl;

    const-string v1, "NO_PROPAGATION"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lio/opencensus/tags/TagMetadata$TagTtl;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/opencensus/tags/TagMetadata$TagTtl;->NO_PROPAGATION:Lio/opencensus/tags/TagMetadata$TagTtl;

    .line 88
    new-instance v1, Lio/opencensus/tags/TagMetadata$TagTtl;

    const/4 v3, -0x1

    const-string v4, "UNLIMITED_PROPAGATION"

    const/4 v5, 0x1

    invoke-direct {v1, v4, v5, v3}, Lio/opencensus/tags/TagMetadata$TagTtl;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lio/opencensus/tags/TagMetadata$TagTtl;->UNLIMITED_PROPAGATION:Lio/opencensus/tags/TagMetadata$TagTtl;

    const/4 v3, 0x2

    .line 68
    new-array v3, v3, [Lio/opencensus/tags/TagMetadata$TagTtl;

    aput-object v0, v3, v2

    aput-object v1, v3, v5

    sput-object v3, Lio/opencensus/tags/TagMetadata$TagTtl;->$VALUES:[Lio/opencensus/tags/TagMetadata$TagTtl;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 92
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 93
    iput p3, p0, Lio/opencensus/tags/TagMetadata$TagTtl;->hops:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lio/opencensus/tags/TagMetadata$TagTtl;
    .locals 1

    .line 68
    const-class v0, Lio/opencensus/tags/TagMetadata$TagTtl;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lio/opencensus/tags/TagMetadata$TagTtl;

    return-object p0
.end method

.method public static values()[Lio/opencensus/tags/TagMetadata$TagTtl;
    .locals 1

    .line 68
    sget-object v0, Lio/opencensus/tags/TagMetadata$TagTtl;->$VALUES:[Lio/opencensus/tags/TagMetadata$TagTtl;

    invoke-virtual {v0}, [Lio/opencensus/tags/TagMetadata$TagTtl;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/opencensus/tags/TagMetadata$TagTtl;

    return-object v0
.end method
