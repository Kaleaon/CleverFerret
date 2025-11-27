.class Lcom/flyersoft/moonreaderp/ActivityTxt$185$1;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Lcom/flyersoft/components/MyMenu$MenuItemClick;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt$185;->onClick(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$185;

.field final synthetic val$fonts:[Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt$185;[Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
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

    .line 18365
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$185$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$185;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$185$1;->val$fonts:[Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(I)V
    .locals 1

    .line 18367
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$185$1;->val$fonts:[Ljava/lang/String;

    aget-object p1, v0, p1

    sput-object p1, Lcom/flyersoft/tools/A;->fontName:Ljava/lang/String;

    .line 18368
    invoke-static {}, Lcom/flyersoft/tools/A;->setTxtViewTypeface()V

    return-void
.end method
