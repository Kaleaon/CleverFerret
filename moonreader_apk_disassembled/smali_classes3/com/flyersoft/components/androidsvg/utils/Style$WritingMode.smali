.class public final enum Lcom/flyersoft/components/androidsvg/utils/Style$WritingMode;
.super Ljava/lang/Enum;
.source "Style.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/androidsvg/utils/Style;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "WritingMode"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/flyersoft/components/androidsvg/utils/Style$WritingMode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/flyersoft/components/androidsvg/utils/Style$WritingMode;

.field public static final enum horizontal_tb:Lcom/flyersoft/components/androidsvg/utils/Style$WritingMode;

.field public static final enum lr:Lcom/flyersoft/components/androidsvg/utils/Style$WritingMode;

.field public static final enum lr_tb:Lcom/flyersoft/components/androidsvg/utils/Style$WritingMode;

.field public static final enum rl:Lcom/flyersoft/components/androidsvg/utils/Style$WritingMode;

.field public static final enum rl_tb:Lcom/flyersoft/components/androidsvg/utils/Style$WritingMode;

.field public static final enum tb:Lcom/flyersoft/components/androidsvg/utils/Style$WritingMode;

.field public static final enum tb_rl:Lcom/flyersoft/components/androidsvg/utils/Style$WritingMode;

.field public static final enum vertical_lr:Lcom/flyersoft/components/androidsvg/utils/Style$WritingMode;

.field public static final enum vertical_rl:Lcom/flyersoft/components/androidsvg/utils/Style$WritingMode;


# direct methods
.method private static synthetic $values()[Lcom/flyersoft/components/androidsvg/utils/Style$WritingMode;
    .locals 3

    const/16 v0, 0x9

    .line 299
    new-array v0, v0, [Lcom/flyersoft/components/androidsvg/utils/Style$WritingMode;

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/Style$WritingMode;->lr_tb:Lcom/flyersoft/components/androidsvg/utils/Style$WritingMode;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/Style$WritingMode;->rl_tb:Lcom/flyersoft/components/androidsvg/utils/Style$WritingMode;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/Style$WritingMode;->tb_rl:Lcom/flyersoft/components/androidsvg/utils/Style$WritingMode;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/Style$WritingMode;->lr:Lcom/flyersoft/components/androidsvg/utils/Style$WritingMode;

    const/4 v2, 0x3

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/Style$WritingMode;->rl:Lcom/flyersoft/components/androidsvg/utils/Style$WritingMode;

    const/4 v2, 0x4

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/Style$WritingMode;->tb:Lcom/flyersoft/components/androidsvg/utils/Style$WritingMode;

    const/4 v2, 0x5

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/Style$WritingMode;->horizontal_tb:Lcom/flyersoft/components/androidsvg/utils/Style$WritingMode;

    const/4 v2, 0x6

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/Style$WritingMode;->vertical_rl:Lcom/flyersoft/components/androidsvg/utils/Style$WritingMode;

    const/4 v2, 0x7

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/Style$WritingMode;->vertical_lr:Lcom/flyersoft/components/androidsvg/utils/Style$WritingMode;

    const/16 v2, 0x8

    aput-object v1, v0, v2

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 302
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/Style$WritingMode;

    const-string v1, "lr_tb"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/components/androidsvg/utils/Style$WritingMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/Style$WritingMode;->lr_tb:Lcom/flyersoft/components/androidsvg/utils/Style$WritingMode;

    .line 303
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/Style$WritingMode;

    const-string v1, "rl_tb"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/components/androidsvg/utils/Style$WritingMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/Style$WritingMode;->rl_tb:Lcom/flyersoft/components/androidsvg/utils/Style$WritingMode;

    .line 304
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/Style$WritingMode;

    const-string v1, "tb_rl"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/components/androidsvg/utils/Style$WritingMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/Style$WritingMode;->tb_rl:Lcom/flyersoft/components/androidsvg/utils/Style$WritingMode;

    .line 305
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/Style$WritingMode;

    const-string v1, "lr"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/components/androidsvg/utils/Style$WritingMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/Style$WritingMode;->lr:Lcom/flyersoft/components/androidsvg/utils/Style$WritingMode;

    .line 306
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/Style$WritingMode;

    const-string v1, "rl"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/components/androidsvg/utils/Style$WritingMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/Style$WritingMode;->rl:Lcom/flyersoft/components/androidsvg/utils/Style$WritingMode;

    .line 307
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/Style$WritingMode;

    const-string v1, "tb"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/components/androidsvg/utils/Style$WritingMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/Style$WritingMode;->tb:Lcom/flyersoft/components/androidsvg/utils/Style$WritingMode;

    .line 309
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/Style$WritingMode;

    const-string v1, "horizontal_tb"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/components/androidsvg/utils/Style$WritingMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/Style$WritingMode;->horizontal_tb:Lcom/flyersoft/components/androidsvg/utils/Style$WritingMode;

    .line 310
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/Style$WritingMode;

    const-string v1, "vertical_rl"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/components/androidsvg/utils/Style$WritingMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/Style$WritingMode;->vertical_rl:Lcom/flyersoft/components/androidsvg/utils/Style$WritingMode;

    .line 311
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/Style$WritingMode;

    const-string v1, "vertical_lr"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/components/androidsvg/utils/Style$WritingMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/Style$WritingMode;->vertical_lr:Lcom/flyersoft/components/androidsvg/utils/Style$WritingMode;

    .line 299
    invoke-static {}, Lcom/flyersoft/components/androidsvg/utils/Style$WritingMode;->$values()[Lcom/flyersoft/components/androidsvg/utils/Style$WritingMode;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/Style$WritingMode;->$VALUES:[Lcom/flyersoft/components/androidsvg/utils/Style$WritingMode;

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

    .line 299
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/Style$WritingMode;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8000
        }
        names = {
            null
        }
    .end annotation

    .line 299
    const-class v0, Lcom/flyersoft/components/androidsvg/utils/Style$WritingMode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/flyersoft/components/androidsvg/utils/Style$WritingMode;

    return-object p0
.end method

.method public static values()[Lcom/flyersoft/components/androidsvg/utils/Style$WritingMode;
    .locals 1

    .line 299
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/Style$WritingMode;->$VALUES:[Lcom/flyersoft/components/androidsvg/utils/Style$WritingMode;

    invoke-virtual {v0}, [Lcom/flyersoft/components/androidsvg/utils/Style$WritingMode;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/flyersoft/components/androidsvg/utils/Style$WritingMode;

    return-object v0
.end method
