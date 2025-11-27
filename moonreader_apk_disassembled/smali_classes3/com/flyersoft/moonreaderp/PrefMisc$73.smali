.class Lcom/flyersoft/moonreaderp/PrefMisc$73;
.super Ljava/lang/Object;
.source "PrefMisc.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc;->createNamesReplacementView(Landroid/content/Context;Ljava/lang/String;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$all:Lcom/flyersoft/views/RoundButton;

.field final synthetic val$base:Landroid/widget/LinearLayout;

.field final synthetic val$context:Landroid/content/Context;

.field final synthetic val$one:Lcom/flyersoft/views/RoundButton;


# direct methods
.method constructor <init>(Lcom/flyersoft/views/RoundButton;Lcom/flyersoft/views/RoundButton;Landroid/content/Context;Landroid/widget/LinearLayout;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1875
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$73;->val$all:Lcom/flyersoft/views/RoundButton;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$73;->val$one:Lcom/flyersoft/views/RoundButton;

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/PrefMisc$73;->val$context:Landroid/content/Context;

    iput-object p4, p0, Lcom/flyersoft/moonreaderp/PrefMisc$73;->val$base:Landroid/widget/LinearLayout;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 1877
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$73;->val$all:Lcom/flyersoft/views/RoundButton;

    invoke-virtual {p1}, Lcom/flyersoft/views/RoundButton;->isChecked()Z

    move-result p1

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    .line 1878
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$73;->val$all:Lcom/flyersoft/views/RoundButton;

    invoke-virtual {p1, v0}, Lcom/flyersoft/views/RoundButton;->setChecked(Z)V

    .line 1879
    invoke-static {}, Lcom/flyersoft/moonreaderp/PrefMisc;->getViewReplaceList()Ljava/util/ArrayList;

    move-result-object p1

    invoke-static {}, Lcom/flyersoft/moonreaderp/PrefMisc;->replaceBookFile()Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v1}, Lcom/flyersoft/tools/A;->saveNamesRelacement(Ljava/util/ArrayList;Ljava/lang/String;)Z

    .line 1881
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$73;->val$one:Lcom/flyersoft/views/RoundButton;

    invoke-virtual {p1}, Lcom/flyersoft/views/RoundButton;->isChecked()Z

    move-result p1

    if-nez p1, :cond_1

    .line 1882
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$73;->val$one:Lcom/flyersoft/views/RoundButton;

    const/4 v1, 0x1

    invoke-virtual {p1, v1}, Lcom/flyersoft/views/RoundButton;->setChecked(Z)V

    .line 1883
    sput-boolean v0, Lcom/flyersoft/moonreaderp/PrefMisc;->replaceForAllBook:Z

    .line 1884
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$73;->val$context:Landroid/content/Context;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc$73;->val$base:Landroid/widget/LinearLayout;

    invoke-static {p1, v0}, Lcom/flyersoft/moonreaderp/PrefMisc;->-$$Nest$smloadReplacesToView(Landroid/content/Context;Landroid/view/View;)Landroid/view/View;

    .line 1886
    :cond_1
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$73;->val$base:Landroid/widget/LinearLayout;

    sget-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->replaceLay:Landroid/widget/LinearLayout;

    invoke-static {p1, v0}, Lcom/flyersoft/moonreaderp/PrefMisc;->-$$Nest$smcheckIfShowSearchForReplaceList(Landroid/view/View;Landroid/widget/LinearLayout;)V

    return-void
.end method
