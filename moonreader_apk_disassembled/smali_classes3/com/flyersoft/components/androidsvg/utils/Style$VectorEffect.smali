.class public final enum Lcom/flyersoft/components/androidsvg/utils/Style$VectorEffect;
.super Ljava/lang/Enum;
.source "Style.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/androidsvg/utils/Style;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "VectorEffect"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/flyersoft/components/androidsvg/utils/Style$VectorEffect;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/flyersoft/components/androidsvg/utils/Style$VectorEffect;

.field public static final enum NonScalingStroke:Lcom/flyersoft/components/androidsvg/utils/Style$VectorEffect;

.field public static final enum None:Lcom/flyersoft/components/androidsvg/utils/Style$VectorEffect;


# direct methods
.method private static synthetic $values()[Lcom/flyersoft/components/androidsvg/utils/Style$VectorEffect;
    .locals 3

    const/4 v0, 0x2

    .line 229
    new-array v0, v0, [Lcom/flyersoft/components/androidsvg/utils/Style$VectorEffect;

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/Style$VectorEffect;->None:Lcom/flyersoft/components/androidsvg/utils/Style$VectorEffect;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/Style$VectorEffect;->NonScalingStroke:Lcom/flyersoft/components/androidsvg/utils/Style$VectorEffect;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 231
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/Style$VectorEffect;

    const-string v1, "None"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/components/androidsvg/utils/Style$VectorEffect;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/Style$VectorEffect;->None:Lcom/flyersoft/components/androidsvg/utils/Style$VectorEffect;

    .line 232
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/Style$VectorEffect;

    const-string v1, "NonScalingStroke"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/components/androidsvg/utils/Style$VectorEffect;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/Style$VectorEffect;->NonScalingStroke:Lcom/flyersoft/components/androidsvg/utils/Style$VectorEffect;

    .line 229
    invoke-static {}, Lcom/flyersoft/components/androidsvg/utils/Style$VectorEffect;->$values()[Lcom/flyersoft/components/androidsvg/utils/Style$VectorEffect;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/Style$VectorEffect;->$VALUES:[Lcom/flyersoft/components/androidsvg/utils/Style$VectorEffect;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000
        }
        names = {
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 229
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/Style$VectorEffect;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8000
        }
        names = {
            null
        }
    .end annotation

    .line 229
    const-class v0, Lcom/flyersoft/components/androidsvg/utils/Style$VectorEffect;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/flyersoft/components/androidsvg/utils/Style$VectorEffect;

    return-object p0
.end method

.method public static values()[Lcom/flyersoft/components/androidsvg/utils/Style$VectorEffect;
    .locals 1

    .line 229
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/Style$VectorEffect;->$VALUES:[Lcom/flyersoft/components/androidsvg/utils/Style$VectorEffect;

    invoke-virtual {v0}, [Lcom/flyersoft/components/androidsvg/utils/Style$VectorEffect;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/flyersoft/components/androidsvg/utils/Style$VectorEffect;

    return-object v0
.end method
