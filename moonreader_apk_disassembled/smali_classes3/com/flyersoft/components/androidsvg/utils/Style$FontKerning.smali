.class public final enum Lcom/flyersoft/components/androidsvg/utils/Style$FontKerning;
.super Ljava/lang/Enum;
.source "Style.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/androidsvg/utils/Style;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "FontKerning"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/flyersoft/components/androidsvg/utils/Style$FontKerning;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/flyersoft/components/androidsvg/utils/Style$FontKerning;

.field public static final enum auto:Lcom/flyersoft/components/androidsvg/utils/Style$FontKerning;

.field public static final enum none:Lcom/flyersoft/components/androidsvg/utils/Style$FontKerning;

.field public static final enum normal:Lcom/flyersoft/components/androidsvg/utils/Style$FontKerning;


# direct methods
.method private static synthetic $values()[Lcom/flyersoft/components/androidsvg/utils/Style$FontKerning;
    .locals 3

    const/4 v0, 0x3

    .line 292
    new-array v0, v0, [Lcom/flyersoft/components/androidsvg/utils/Style$FontKerning;

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/Style$FontKerning;->auto:Lcom/flyersoft/components/androidsvg/utils/Style$FontKerning;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/Style$FontKerning;->normal:Lcom/flyersoft/components/androidsvg/utils/Style$FontKerning;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/Style$FontKerning;->none:Lcom/flyersoft/components/androidsvg/utils/Style$FontKerning;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 294
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/Style$FontKerning;

    const-string v1, "auto"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/components/androidsvg/utils/Style$FontKerning;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/Style$FontKerning;->auto:Lcom/flyersoft/components/androidsvg/utils/Style$FontKerning;

    .line 295
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/Style$FontKerning;

    const-string v1, "normal"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/components/androidsvg/utils/Style$FontKerning;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/Style$FontKerning;->normal:Lcom/flyersoft/components/androidsvg/utils/Style$FontKerning;

    .line 296
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/Style$FontKerning;

    const-string v1, "none"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/components/androidsvg/utils/Style$FontKerning;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/Style$FontKerning;->none:Lcom/flyersoft/components/androidsvg/utils/Style$FontKerning;

    .line 292
    invoke-static {}, Lcom/flyersoft/components/androidsvg/utils/Style$FontKerning;->$values()[Lcom/flyersoft/components/androidsvg/utils/Style$FontKerning;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/Style$FontKerning;->$VALUES:[Lcom/flyersoft/components/androidsvg/utils/Style$FontKerning;

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

    .line 292
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/Style$FontKerning;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8000
        }
        names = {
            null
        }
    .end annotation

    .line 292
    const-class v0, Lcom/flyersoft/components/androidsvg/utils/Style$FontKerning;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/flyersoft/components/androidsvg/utils/Style$FontKerning;

    return-object p0
.end method

.method public static values()[Lcom/flyersoft/components/androidsvg/utils/Style$FontKerning;
    .locals 1

    .line 292
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/Style$FontKerning;->$VALUES:[Lcom/flyersoft/components/androidsvg/utils/Style$FontKerning;

    invoke-virtual {v0}, [Lcom/flyersoft/components/androidsvg/utils/Style$FontKerning;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/flyersoft/components/androidsvg/utils/Style$FontKerning;

    return-object v0
.end method
