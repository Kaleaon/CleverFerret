.class public final enum Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Scale;
.super Ljava/lang/Enum;
.source "PreserveAspectRatio.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Scale"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Scale;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Scale;

.field public static final enum meet:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Scale;

.field public static final enum slice:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Scale;


# direct methods
.method private static synthetic $values()[Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Scale;
    .locals 3

    const/4 v0, 0x2

    .line 182
    new-array v0, v0, [Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Scale;

    sget-object v1, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Scale;->meet:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Scale;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Scale;->slice:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Scale;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 188
    new-instance v0, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Scale;

    const-string v1, "meet"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Scale;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Scale;->meet:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Scale;

    .line 193
    new-instance v0, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Scale;

    const-string v1, "slice"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Scale;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Scale;->slice:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Scale;

    .line 182
    invoke-static {}, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Scale;->$values()[Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Scale;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Scale;->$VALUES:[Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Scale;

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

    .line 182
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Scale;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8000
        }
        names = {
            null
        }
    .end annotation

    .line 182
    const-class v0, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Scale;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Scale;

    return-object p0
.end method

.method public static values()[Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Scale;
    .locals 1

    .line 182
    sget-object v0, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Scale;->$VALUES:[Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Scale;

    invoke-virtual {v0}, [Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Scale;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Scale;

    return-object v0
.end method
