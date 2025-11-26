.class public final enum Lcom/flyersoft/components/androidsvg/utils/Style$TextDirection;
.super Ljava/lang/Enum;
.source "Style.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/androidsvg/utils/Style;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "TextDirection"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/flyersoft/components/androidsvg/utils/Style$TextDirection;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/flyersoft/components/androidsvg/utils/Style$TextDirection;

.field public static final enum LTR:Lcom/flyersoft/components/androidsvg/utils/Style$TextDirection;

.field public static final enum RTL:Lcom/flyersoft/components/androidsvg/utils/Style$TextDirection;


# direct methods
.method private static synthetic $values()[Lcom/flyersoft/components/androidsvg/utils/Style$TextDirection;
    .locals 3

    const/4 v0, 0x2

    .line 223
    new-array v0, v0, [Lcom/flyersoft/components/androidsvg/utils/Style$TextDirection;

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/Style$TextDirection;->LTR:Lcom/flyersoft/components/androidsvg/utils/Style$TextDirection;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/Style$TextDirection;->RTL:Lcom/flyersoft/components/androidsvg/utils/Style$TextDirection;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 225
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/Style$TextDirection;

    const-string v1, "LTR"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/components/androidsvg/utils/Style$TextDirection;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/Style$TextDirection;->LTR:Lcom/flyersoft/components/androidsvg/utils/Style$TextDirection;

    .line 226
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/Style$TextDirection;

    const-string v1, "RTL"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/components/androidsvg/utils/Style$TextDirection;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/Style$TextDirection;->RTL:Lcom/flyersoft/components/androidsvg/utils/Style$TextDirection;

    .line 223
    invoke-static {}, Lcom/flyersoft/components/androidsvg/utils/Style$TextDirection;->$values()[Lcom/flyersoft/components/androidsvg/utils/Style$TextDirection;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/Style$TextDirection;->$VALUES:[Lcom/flyersoft/components/androidsvg/utils/Style$TextDirection;

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

    .line 223
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/Style$TextDirection;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8000
        }
        names = {
            null
        }
    .end annotation

    .line 223
    const-class v0, Lcom/flyersoft/components/androidsvg/utils/Style$TextDirection;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/flyersoft/components/androidsvg/utils/Style$TextDirection;

    return-object p0
.end method

.method public static values()[Lcom/flyersoft/components/androidsvg/utils/Style$TextDirection;
    .locals 1

    .line 223
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/Style$TextDirection;->$VALUES:[Lcom/flyersoft/components/androidsvg/utils/Style$TextDirection;

    invoke-virtual {v0}, [Lcom/flyersoft/components/androidsvg/utils/Style$TextDirection;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/flyersoft/components/androidsvg/utils/Style$TextDirection;

    return-object v0
.end method
