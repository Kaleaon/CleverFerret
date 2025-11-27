.class public final enum Lcom/flyersoft/components/androidsvg/utils/Style$GlypOrientationVertical;
.super Ljava/lang/Enum;
.source "Style.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/androidsvg/utils/Style;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "GlypOrientationVertical"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/flyersoft/components/androidsvg/utils/Style$GlypOrientationVertical;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/flyersoft/components/androidsvg/utils/Style$GlypOrientationVertical;

.field public static final enum angle0:Lcom/flyersoft/components/androidsvg/utils/Style$GlypOrientationVertical;

.field public static final enum angle180:Lcom/flyersoft/components/androidsvg/utils/Style$GlypOrientationVertical;

.field public static final enum angle270:Lcom/flyersoft/components/androidsvg/utils/Style$GlypOrientationVertical;

.field public static final enum angle90:Lcom/flyersoft/components/androidsvg/utils/Style$GlypOrientationVertical;

.field public static final enum auto:Lcom/flyersoft/components/androidsvg/utils/Style$GlypOrientationVertical;


# direct methods
.method private static synthetic $values()[Lcom/flyersoft/components/androidsvg/utils/Style$GlypOrientationVertical;
    .locals 3

    const/4 v0, 0x5

    .line 315
    new-array v0, v0, [Lcom/flyersoft/components/androidsvg/utils/Style$GlypOrientationVertical;

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/Style$GlypOrientationVertical;->auto:Lcom/flyersoft/components/androidsvg/utils/Style$GlypOrientationVertical;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/Style$GlypOrientationVertical;->angle0:Lcom/flyersoft/components/androidsvg/utils/Style$GlypOrientationVertical;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/Style$GlypOrientationVertical;->angle90:Lcom/flyersoft/components/androidsvg/utils/Style$GlypOrientationVertical;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/Style$GlypOrientationVertical;->angle180:Lcom/flyersoft/components/androidsvg/utils/Style$GlypOrientationVertical;

    const/4 v2, 0x3

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/Style$GlypOrientationVertical;->angle270:Lcom/flyersoft/components/androidsvg/utils/Style$GlypOrientationVertical;

    const/4 v2, 0x4

    aput-object v1, v0, v2

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 317
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/Style$GlypOrientationVertical;

    const-string v1, "auto"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/components/androidsvg/utils/Style$GlypOrientationVertical;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/Style$GlypOrientationVertical;->auto:Lcom/flyersoft/components/androidsvg/utils/Style$GlypOrientationVertical;

    .line 318
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/Style$GlypOrientationVertical;

    const-string v1, "angle0"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/components/androidsvg/utils/Style$GlypOrientationVertical;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/Style$GlypOrientationVertical;->angle0:Lcom/flyersoft/components/androidsvg/utils/Style$GlypOrientationVertical;

    .line 319
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/Style$GlypOrientationVertical;

    const-string v1, "angle90"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/components/androidsvg/utils/Style$GlypOrientationVertical;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/Style$GlypOrientationVertical;->angle90:Lcom/flyersoft/components/androidsvg/utils/Style$GlypOrientationVertical;

    .line 320
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/Style$GlypOrientationVertical;

    const-string v1, "angle180"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/components/androidsvg/utils/Style$GlypOrientationVertical;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/Style$GlypOrientationVertical;->angle180:Lcom/flyersoft/components/androidsvg/utils/Style$GlypOrientationVertical;

    .line 321
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/Style$GlypOrientationVertical;

    const-string v1, "angle270"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/components/androidsvg/utils/Style$GlypOrientationVertical;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/Style$GlypOrientationVertical;->angle270:Lcom/flyersoft/components/androidsvg/utils/Style$GlypOrientationVertical;

    .line 315
    invoke-static {}, Lcom/flyersoft/components/androidsvg/utils/Style$GlypOrientationVertical;->$values()[Lcom/flyersoft/components/androidsvg/utils/Style$GlypOrientationVertical;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/Style$GlypOrientationVertical;->$VALUES:[Lcom/flyersoft/components/androidsvg/utils/Style$GlypOrientationVertical;

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

    .line 315
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/Style$GlypOrientationVertical;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8000
        }
        names = {
            null
        }
    .end annotation

    .line 315
    const-class v0, Lcom/flyersoft/components/androidsvg/utils/Style$GlypOrientationVertical;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/flyersoft/components/androidsvg/utils/Style$GlypOrientationVertical;

    return-object p0
.end method

.method public static values()[Lcom/flyersoft/components/androidsvg/utils/Style$GlypOrientationVertical;
    .locals 1

    .line 315
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/Style$GlypOrientationVertical;->$VALUES:[Lcom/flyersoft/components/androidsvg/utils/Style$GlypOrientationVertical;

    invoke-virtual {v0}, [Lcom/flyersoft/components/androidsvg/utils/Style$GlypOrientationVertical;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/flyersoft/components/androidsvg/utils/Style$GlypOrientationVertical;

    return-object v0
.end method
