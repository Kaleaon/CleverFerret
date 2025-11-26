.class public final enum Lcom/flyersoft/components/androidsvg/utils/Style$FontStyle;
.super Ljava/lang/Enum;
.source "Style.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/androidsvg/utils/Style;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "FontStyle"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/flyersoft/components/androidsvg/utils/Style$FontStyle;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/flyersoft/components/androidsvg/utils/Style$FontStyle;

.field public static final enum italic:Lcom/flyersoft/components/androidsvg/utils/Style$FontStyle;

.field public static final enum normal:Lcom/flyersoft/components/androidsvg/utils/Style$FontStyle;

.field public static final enum oblique:Lcom/flyersoft/components/androidsvg/utils/Style$FontStyle;


# direct methods
.method private static synthetic $values()[Lcom/flyersoft/components/androidsvg/utils/Style$FontStyle;
    .locals 3

    const/4 v0, 0x3

    .line 200
    new-array v0, v0, [Lcom/flyersoft/components/androidsvg/utils/Style$FontStyle;

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/Style$FontStyle;->normal:Lcom/flyersoft/components/androidsvg/utils/Style$FontStyle;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/Style$FontStyle;->italic:Lcom/flyersoft/components/androidsvg/utils/Style$FontStyle;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/Style$FontStyle;->oblique:Lcom/flyersoft/components/androidsvg/utils/Style$FontStyle;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 202
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/Style$FontStyle;

    const-string v1, "normal"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/components/androidsvg/utils/Style$FontStyle;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/Style$FontStyle;->normal:Lcom/flyersoft/components/androidsvg/utils/Style$FontStyle;

    .line 203
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/Style$FontStyle;

    const-string v1, "italic"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/components/androidsvg/utils/Style$FontStyle;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/Style$FontStyle;->italic:Lcom/flyersoft/components/androidsvg/utils/Style$FontStyle;

    .line 204
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/Style$FontStyle;

    const-string v1, "oblique"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/components/androidsvg/utils/Style$FontStyle;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/Style$FontStyle;->oblique:Lcom/flyersoft/components/androidsvg/utils/Style$FontStyle;

    .line 200
    invoke-static {}, Lcom/flyersoft/components/androidsvg/utils/Style$FontStyle;->$values()[Lcom/flyersoft/components/androidsvg/utils/Style$FontStyle;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/Style$FontStyle;->$VALUES:[Lcom/flyersoft/components/androidsvg/utils/Style$FontStyle;

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

    .line 200
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/Style$FontStyle;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8000
        }
        names = {
            null
        }
    .end annotation

    .line 200
    const-class v0, Lcom/flyersoft/components/androidsvg/utils/Style$FontStyle;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/flyersoft/components/androidsvg/utils/Style$FontStyle;

    return-object p0
.end method

.method public static values()[Lcom/flyersoft/components/androidsvg/utils/Style$FontStyle;
    .locals 1

    .line 200
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/Style$FontStyle;->$VALUES:[Lcom/flyersoft/components/androidsvg/utils/Style$FontStyle;

    invoke-virtual {v0}, [Lcom/flyersoft/components/androidsvg/utils/Style$FontStyle;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/flyersoft/components/androidsvg/utils/Style$FontStyle;

    return-object v0
.end method
