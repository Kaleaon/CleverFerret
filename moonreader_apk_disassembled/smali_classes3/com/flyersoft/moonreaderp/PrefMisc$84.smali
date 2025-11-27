.class Lcom/flyersoft/moonreaderp/PrefMisc$84;
.super Ljava/lang/Object;
.source "PrefMisc.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc;->setReplaceItemProperties(Landroid/content/Context;Landroid/view/View;Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$base:Landroid/view/View;

.field final synthetic val$context:Landroid/content/Context;


# direct methods
.method constructor <init>(Landroid/content/Context;Landroid/view/View;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 2119
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$84;->val$context:Landroid/content/Context;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$84;->val$base:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    .line 2121
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    .line 2122
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 2123
    invoke-static {}, Lcom/flyersoft/moonreaderp/PrefMisc;->-$$Nest$sfgetrepalcesList()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lt v0, v1, :cond_0

    .line 2124
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc$84;->val$context:Landroid/content/Context;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$84;->val$base:Landroid/view/View;

    const-string v2, ""

    invoke-static {v2, v0, v1, p1}, Lcom/flyersoft/moonreaderp/PrefMisc;->-$$Nest$smaddNewReplaceItem(Ljava/lang/String;Landroid/content/Context;Landroid/view/View;Landroid/view/View;)V

    goto :goto_0

    .line 2126
    :cond_0
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->replaceLay:Landroid/widget/LinearLayout;

    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    .line 2128
    :goto_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$84;->val$base:Landroid/view/View;

    sget-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->replaceLay:Landroid/widget/LinearLayout;

    invoke-static {p1, v0}, Lcom/flyersoft/moonreaderp/PrefMisc;->-$$Nest$smcheckIfShowSearchForReplaceList(Landroid/view/View;Landroid/widget/LinearLayout;)V

    return-void
.end method
