.class final enum Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;
.super Ljava/lang/Enum;
.source "SVGBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/androidsvg/utils/SVGBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "Unit"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

.field public static final enum cm:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

.field public static final enum em:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

.field public static final enum ex:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

.field public static final enum in:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

.field public static final enum mm:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

.field public static final enum pc:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

.field public static final enum percent:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

.field public static final enum pt:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

.field public static final enum px:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;


# direct methods
.method private static synthetic $values()[Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;
    .locals 3

    const/16 v0, 0x9

    .line 117
    new-array v0, v0, [Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;->px:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;->em:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;->ex:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;->in:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    const/4 v2, 0x3

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;->cm:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    const/4 v2, 0x4

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;->mm:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    const/4 v2, 0x5

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;->pt:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    const/4 v2, 0x6

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;->pc:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    const/4 v2, 0x7

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;->percent:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    const/16 v2, 0x8

    aput-object v1, v0, v2

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 119
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    const-string v1, "px"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;->px:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    .line 120
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    const-string v1, "em"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;->em:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    .line 121
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    const-string v1, "ex"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;->ex:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    .line 122
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    const-string v1, "in"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;->in:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    .line 123
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    const-string v1, "cm"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;->cm:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    .line 124
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    const-string v1, "mm"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;->mm:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    .line 125
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    const-string v1, "pt"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;->pt:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    .line 126
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    const-string v1, "pc"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;->pc:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    .line 127
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    const-string v1, "percent"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;->percent:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    .line 117
    invoke-static {}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;->$values()[Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;->$VALUES:[Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

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

    .line 117
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8000
        }
        names = {
            null
        }
    .end annotation

    .line 117
    const-class v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    return-object p0
.end method

.method public static values()[Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;
    .locals 1

    .line 117
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;->$VALUES:[Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    invoke-virtual {v0}, [Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    return-object v0
.end method
