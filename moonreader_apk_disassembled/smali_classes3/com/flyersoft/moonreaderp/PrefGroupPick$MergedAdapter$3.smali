.class Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter$3;
.super Ljava/lang/Object;
.source "PrefGroupPick.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 253
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter$3;->this$1:Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 255
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter$3;->this$1:Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupPick;

    iget-boolean v0, v0, Lcom/flyersoft/moonreaderp/PrefGroupPick;->mShowRemoveButton:Z

    if-eqz v0, :cond_0

    .line 256
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter$3;->this$1:Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupPick;

    const/4 v0, 0x0

    iput-boolean v0, p1, Lcom/flyersoft/moonreaderp/PrefGroupPick;->mShowRemoveButton:Z

    .line 257
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter$3;->this$1:Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter;->notifyDataSetChanged()V

    return-void

    .line 260
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter$3;->this$1:Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupPick;

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/tools/BookDb$BookInfo;

    iput-object p1, v0, Lcom/flyersoft/moonreaderp/PrefGroupPick;->selected:Lcom/flyersoft/tools/BookDb$BookInfo;

    .line 261
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter$3;->this$1:Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupPick;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefGroupPick;->dismiss()V

    return-void
.end method
