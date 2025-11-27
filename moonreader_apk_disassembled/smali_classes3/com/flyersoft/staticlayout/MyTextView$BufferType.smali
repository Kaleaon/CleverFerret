.class public final enum Lcom/flyersoft/staticlayout/MyTextView$BufferType;
.super Ljava/lang/Enum;
.source "MyTextView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/staticlayout/MyTextView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "BufferType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/flyersoft/staticlayout/MyTextView$BufferType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/flyersoft/staticlayout/MyTextView$BufferType;

.field public static final enum EDITABLE:Lcom/flyersoft/staticlayout/MyTextView$BufferType;

.field public static final enum NORMAL:Lcom/flyersoft/staticlayout/MyTextView$BufferType;

.field public static final enum SPANNABLE:Lcom/flyersoft/staticlayout/MyTextView$BufferType;


# direct methods
.method private static synthetic $values()[Lcom/flyersoft/staticlayout/MyTextView$BufferType;
    .locals 3

    const/4 v0, 0x3

    .line 595
    new-array v0, v0, [Lcom/flyersoft/staticlayout/MyTextView$BufferType;

    sget-object v1, Lcom/flyersoft/staticlayout/MyTextView$BufferType;->NORMAL:Lcom/flyersoft/staticlayout/MyTextView$BufferType;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/staticlayout/MyTextView$BufferType;->SPANNABLE:Lcom/flyersoft/staticlayout/MyTextView$BufferType;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/staticlayout/MyTextView$BufferType;->EDITABLE:Lcom/flyersoft/staticlayout/MyTextView$BufferType;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 596
    new-instance v0, Lcom/flyersoft/staticlayout/MyTextView$BufferType;

    const-string v1, "NORMAL"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/staticlayout/MyTextView$BufferType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/staticlayout/MyTextView$BufferType;->NORMAL:Lcom/flyersoft/staticlayout/MyTextView$BufferType;

    new-instance v0, Lcom/flyersoft/staticlayout/MyTextView$BufferType;

    const-string v1, "SPANNABLE"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/staticlayout/MyTextView$BufferType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/staticlayout/MyTextView$BufferType;->SPANNABLE:Lcom/flyersoft/staticlayout/MyTextView$BufferType;

    new-instance v0, Lcom/flyersoft/staticlayout/MyTextView$BufferType;

    const-string v1, "EDITABLE"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/staticlayout/MyTextView$BufferType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/staticlayout/MyTextView$BufferType;->EDITABLE:Lcom/flyersoft/staticlayout/MyTextView$BufferType;

    .line 595
    invoke-static {}, Lcom/flyersoft/staticlayout/MyTextView$BufferType;->$values()[Lcom/flyersoft/staticlayout/MyTextView$BufferType;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/staticlayout/MyTextView$BufferType;->$VALUES:[Lcom/flyersoft/staticlayout/MyTextView$BufferType;

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

    .line 595
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/flyersoft/staticlayout/MyTextView$BufferType;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8000
        }
        names = {
            null
        }
    .end annotation

    .line 595
    const-class v0, Lcom/flyersoft/staticlayout/MyTextView$BufferType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/flyersoft/staticlayout/MyTextView$BufferType;

    return-object p0
.end method

.method public static values()[Lcom/flyersoft/staticlayout/MyTextView$BufferType;
    .locals 1

    .line 595
    sget-object v0, Lcom/flyersoft/staticlayout/MyTextView$BufferType;->$VALUES:[Lcom/flyersoft/staticlayout/MyTextView$BufferType;

    invoke-virtual {v0}, [Lcom/flyersoft/staticlayout/MyTextView$BufferType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/flyersoft/staticlayout/MyTextView$BufferType;

    return-object v0
.end method
