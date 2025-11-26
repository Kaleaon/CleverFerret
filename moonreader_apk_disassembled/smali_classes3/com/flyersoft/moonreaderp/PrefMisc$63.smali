.class Lcom/flyersoft/moonreaderp/PrefMisc$63;
.super Ljava/lang/Object;
.source "PrefMisc.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc;->showReplacmentDialog(Landroid/content/Context;Lcom/flyersoft/moonreaderp/PrefMisc$OnAfterVerifyReplacement;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$afterVerify:Lcom/flyersoft/moonreaderp/PrefMisc$OnAfterVerifyReplacement;

.field final synthetic val$context:Landroid/content/Context;


# direct methods
.method constructor <init>(Landroid/content/Context;Lcom/flyersoft/moonreaderp/PrefMisc$OnAfterVerifyReplacement;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1597
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$63;->val$context:Landroid/content/Context;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$63;->val$afterVerify:Lcom/flyersoft/moonreaderp/PrefMisc$OnAfterVerifyReplacement;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 1599
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$63;->val$context:Landroid/content/Context;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefMisc;->verifyReplacementOk(Landroid/content/Context;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 1600
    invoke-static {}, Lcom/flyersoft/moonreaderp/PrefMisc;->getViewReplaceList()Ljava/util/ArrayList;

    move-result-object p1

    invoke-static {}, Lcom/flyersoft/moonreaderp/PrefMisc;->replaceBookFile()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/flyersoft/tools/A;->saveNamesRelacement(Ljava/util/ArrayList;Ljava/lang/String;)Z

    .line 1601
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$63;->val$afterVerify:Lcom/flyersoft/moonreaderp/PrefMisc$OnAfterVerifyReplacement;

    if-eqz p1, :cond_0

    .line 1602
    invoke-interface {p1}, Lcom/flyersoft/moonreaderp/PrefMisc$OnAfterVerifyReplacement;->afterVerify()V

    :cond_0
    const/4 p1, 0x0

    .line 1604
    sput-object p1, Lcom/flyersoft/moonreaderp/PrefMisc;->replaceLay:Landroid/widget/LinearLayout;

    sput-object p1, Lcom/flyersoft/moonreaderp/PrefMisc;->filterLay:Landroid/widget/LinearLayout;

    return-void
.end method
