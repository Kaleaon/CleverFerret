.class public final enum Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;
.super Ljava/lang/Enum;
.source "PreserveAspectRatio.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Alignment"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;

.field public static final enum none:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;

.field public static final enum xMaxYMax:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;

.field public static final enum xMaxYMid:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;

.field public static final enum xMaxYMin:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;

.field public static final enum xMidYMax:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;

.field public static final enum xMidYMid:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;

.field public static final enum xMidYMin:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;

.field public static final enum xMinYMax:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;

.field public static final enum xMinYMid:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;

.field public static final enum xMinYMin:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;


# direct methods
.method private static synthetic $values()[Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;
    .locals 3

    const/16 v0, 0xa

    .line 152
    new-array v0, v0, [Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;

    sget-object v1, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;->none:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;->xMinYMin:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;->xMidYMin:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;->xMaxYMin:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;

    const/4 v2, 0x3

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;->xMinYMid:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;

    const/4 v2, 0x4

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;->xMidYMid:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;

    const/4 v2, 0x5

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;->xMaxYMid:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;

    const/4 v2, 0x6

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;->xMinYMax:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;

    const/4 v2, 0x7

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;->xMidYMax:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;

    const/16 v2, 0x8

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;->xMaxYMax:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;

    const/16 v2, 0x9

    aput-object v1, v0, v2

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 155
    new-instance v0, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;

    const-string v1, "none"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;->none:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;

    .line 157
    new-instance v0, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;

    const-string v1, "xMinYMin"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;->xMinYMin:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;

    .line 159
    new-instance v0, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;

    const-string v1, "xMidYMin"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;->xMidYMin:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;

    .line 161
    new-instance v0, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;

    const-string v1, "xMaxYMin"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;->xMaxYMin:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;

    .line 163
    new-instance v0, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;

    const-string v1, "xMinYMid"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;->xMinYMid:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;

    .line 165
    new-instance v0, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;

    const-string v1, "xMidYMid"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;->xMidYMid:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;

    .line 167
    new-instance v0, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;

    const-string v1, "xMaxYMid"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;->xMaxYMid:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;

    .line 169
    new-instance v0, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;

    const-string v1, "xMinYMax"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;->xMinYMax:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;

    .line 171
    new-instance v0, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;

    const-string v1, "xMidYMax"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;->xMidYMax:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;

    .line 173
    new-instance v0, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;

    const-string v1, "xMaxYMax"

    const/16 v2, 0x9

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;->xMaxYMax:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;

    .line 152
    invoke-static {}, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;->$values()[Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;->$VALUES:[Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;

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

    .line 152
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8000
        }
        names = {
            null
        }
    .end annotation

    .line 152
    const-class v0, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;

    return-object p0
.end method

.method public static values()[Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;
    .locals 1

    .line 152
    sget-object v0, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;->$VALUES:[Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;

    invoke-virtual {v0}, [Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;

    return-object v0
.end method
