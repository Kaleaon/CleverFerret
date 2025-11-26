.class Lcom/flyersoft/moonreaderp/ActivityTxt$174;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Lcom/flyersoft/tools/T$OnUrlClick;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->showCssMissedFontsTip()Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

.field final synthetic val$fonts:Ljava/util/ArrayList;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt;Ljava/util/ArrayList;)V
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

    .line 17831
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$174;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$174;->val$fonts:Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Ljava/lang/String;)V
    .locals 3

    .line 17833
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$174;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$174;->val$fonts:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x1

    if-le v1, v2, :cond_0

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    invoke-static {v0, p1, v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mdownloadFont(Lcom/flyersoft/moonreaderp/ActivityTxt;Ljava/lang/String;Z)V

    return-void
.end method
