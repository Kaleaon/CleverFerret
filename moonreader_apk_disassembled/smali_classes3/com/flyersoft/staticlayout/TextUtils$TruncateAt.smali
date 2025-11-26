.class public final enum Lcom/flyersoft/staticlayout/TextUtils$TruncateAt;
.super Ljava/lang/Enum;
.source "TextUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/staticlayout/TextUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "TruncateAt"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/flyersoft/staticlayout/TextUtils$TruncateAt;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/flyersoft/staticlayout/TextUtils$TruncateAt;

.field public static final enum END:Lcom/flyersoft/staticlayout/TextUtils$TruncateAt;

.field public static final enum MARQUEE:Lcom/flyersoft/staticlayout/TextUtils$TruncateAt;

.field public static final enum MIDDLE:Lcom/flyersoft/staticlayout/TextUtils$TruncateAt;

.field public static final enum START:Lcom/flyersoft/staticlayout/TextUtils$TruncateAt;


# direct methods
.method private static synthetic $values()[Lcom/flyersoft/staticlayout/TextUtils$TruncateAt;
    .locals 3

    const/4 v0, 0x4

    .line 804
    new-array v0, v0, [Lcom/flyersoft/staticlayout/TextUtils$TruncateAt;

    sget-object v1, Lcom/flyersoft/staticlayout/TextUtils$TruncateAt;->START:Lcom/flyersoft/staticlayout/TextUtils$TruncateAt;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/staticlayout/TextUtils$TruncateAt;->MIDDLE:Lcom/flyersoft/staticlayout/TextUtils$TruncateAt;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/staticlayout/TextUtils$TruncateAt;->END:Lcom/flyersoft/staticlayout/TextUtils$TruncateAt;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/staticlayout/TextUtils$TruncateAt;->MARQUEE:Lcom/flyersoft/staticlayout/TextUtils$TruncateAt;

    const/4 v2, 0x3

    aput-object v1, v0, v2

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 805
    new-instance v0, Lcom/flyersoft/staticlayout/TextUtils$TruncateAt;

    const-string v1, "START"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/staticlayout/TextUtils$TruncateAt;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/staticlayout/TextUtils$TruncateAt;->START:Lcom/flyersoft/staticlayout/TextUtils$TruncateAt;

    .line 806
    new-instance v0, Lcom/flyersoft/staticlayout/TextUtils$TruncateAt;

    const-string v1, "MIDDLE"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/staticlayout/TextUtils$TruncateAt;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/staticlayout/TextUtils$TruncateAt;->MIDDLE:Lcom/flyersoft/staticlayout/TextUtils$TruncateAt;

    .line 807
    new-instance v0, Lcom/flyersoft/staticlayout/TextUtils$TruncateAt;

    const-string v1, "END"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/staticlayout/TextUtils$TruncateAt;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/staticlayout/TextUtils$TruncateAt;->END:Lcom/flyersoft/staticlayout/TextUtils$TruncateAt;

    .line 808
    new-instance v0, Lcom/flyersoft/staticlayout/TextUtils$TruncateAt;

    const-string v1, "MARQUEE"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/staticlayout/TextUtils$TruncateAt;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/staticlayout/TextUtils$TruncateAt;->MARQUEE:Lcom/flyersoft/staticlayout/TextUtils$TruncateAt;

    .line 804
    invoke-static {}, Lcom/flyersoft/staticlayout/TextUtils$TruncateAt;->$values()[Lcom/flyersoft/staticlayout/TextUtils$TruncateAt;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/staticlayout/TextUtils$TruncateAt;->$VALUES:[Lcom/flyersoft/staticlayout/TextUtils$TruncateAt;

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

    .line 804
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/flyersoft/staticlayout/TextUtils$TruncateAt;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8000
        }
        names = {
            null
        }
    .end annotation

    .line 804
    const-class v0, Lcom/flyersoft/staticlayout/TextUtils$TruncateAt;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/flyersoft/staticlayout/TextUtils$TruncateAt;

    return-object p0
.end method

.method public static values()[Lcom/flyersoft/staticlayout/TextUtils$TruncateAt;
    .locals 1

    .line 804
    sget-object v0, Lcom/flyersoft/staticlayout/TextUtils$TruncateAt;->$VALUES:[Lcom/flyersoft/staticlayout/TextUtils$TruncateAt;

    invoke-virtual {v0}, [Lcom/flyersoft/staticlayout/TextUtils$TruncateAt;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/flyersoft/staticlayout/TextUtils$TruncateAt;

    return-object v0
.end method
