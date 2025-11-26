.class public final enum Lcom/flyersoft/components/androidsvg/utils/Style$LineJoin;
.super Ljava/lang/Enum;
.source "Style.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/androidsvg/utils/Style;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "LineJoin"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/flyersoft/components/androidsvg/utils/Style$LineJoin;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/flyersoft/components/androidsvg/utils/Style$LineJoin;

.field public static final enum Bevel:Lcom/flyersoft/components/androidsvg/utils/Style$LineJoin;

.field public static final enum Miter:Lcom/flyersoft/components/androidsvg/utils/Style$LineJoin;

.field public static final enum Round:Lcom/flyersoft/components/androidsvg/utils/Style$LineJoin;


# direct methods
.method private static synthetic $values()[Lcom/flyersoft/components/androidsvg/utils/Style$LineJoin;
    .locals 3

    const/4 v0, 0x3

    .line 193
    new-array v0, v0, [Lcom/flyersoft/components/androidsvg/utils/Style$LineJoin;

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/Style$LineJoin;->Miter:Lcom/flyersoft/components/androidsvg/utils/Style$LineJoin;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/Style$LineJoin;->Round:Lcom/flyersoft/components/androidsvg/utils/Style$LineJoin;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/Style$LineJoin;->Bevel:Lcom/flyersoft/components/androidsvg/utils/Style$LineJoin;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 195
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/Style$LineJoin;

    const-string v1, "Miter"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/components/androidsvg/utils/Style$LineJoin;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/Style$LineJoin;->Miter:Lcom/flyersoft/components/androidsvg/utils/Style$LineJoin;

    .line 196
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/Style$LineJoin;

    const-string v1, "Round"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/components/androidsvg/utils/Style$LineJoin;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/Style$LineJoin;->Round:Lcom/flyersoft/components/androidsvg/utils/Style$LineJoin;

    .line 197
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/Style$LineJoin;

    const-string v1, "Bevel"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/components/androidsvg/utils/Style$LineJoin;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/Style$LineJoin;->Bevel:Lcom/flyersoft/components/androidsvg/utils/Style$LineJoin;

    .line 193
    invoke-static {}, Lcom/flyersoft/components/androidsvg/utils/Style$LineJoin;->$values()[Lcom/flyersoft/components/androidsvg/utils/Style$LineJoin;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/Style$LineJoin;->$VALUES:[Lcom/flyersoft/components/androidsvg/utils/Style$LineJoin;

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

    .line 193
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/Style$LineJoin;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8000
        }
        names = {
            null
        }
    .end annotation

    .line 193
    const-class v0, Lcom/flyersoft/components/androidsvg/utils/Style$LineJoin;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/flyersoft/components/androidsvg/utils/Style$LineJoin;

    return-object p0
.end method

.method public static values()[Lcom/flyersoft/components/androidsvg/utils/Style$LineJoin;
    .locals 1

    .line 193
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/Style$LineJoin;->$VALUES:[Lcom/flyersoft/components/androidsvg/utils/Style$LineJoin;

    invoke-virtual {v0}, [Lcom/flyersoft/components/androidsvg/utils/Style$LineJoin;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/flyersoft/components/androidsvg/utils/Style$LineJoin;

    return-object v0
.end method
