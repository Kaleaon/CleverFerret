.class Lcom/flyersoft/moonreaderp/PrefMisc$52;
.super Ljava/lang/Object;
.source "PrefMisc.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc;->showCssFontOptions(Landroid/app/Dialog;Lcom/flyersoft/moonreaderp/PrefFolderPick$OnGetFolder;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$onFolderChanged:Lcom/flyersoft/moonreaderp/PrefFolderPick$OnGetFolder;

.field final synthetic val$res:Landroid/content/Context;

.field final synthetic val$tv:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Landroid/content/Context;Landroid/widget/TextView;Lcom/flyersoft/moonreaderp/PrefFolderPick$OnGetFolder;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1452
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$52;->val$res:Landroid/content/Context;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$52;->val$tv:Landroid/widget/TextView;

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/PrefMisc$52;->val$onFolderChanged:Lcom/flyersoft/moonreaderp/PrefFolderPick$OnGetFolder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4

    .line 1454
    new-instance p1, Lcom/flyersoft/moonreaderp/PrefFolderPick;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc$52;->val$res:Landroid/content/Context;

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->font_folder:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lcom/flyersoft/tools/A;->outerFontsFolder:Ljava/lang/String;

    new-instance v3, Lcom/flyersoft/moonreaderp/PrefMisc$52$1;

    invoke-direct {v3, p0}, Lcom/flyersoft/moonreaderp/PrefMisc$52$1;-><init>(Lcom/flyersoft/moonreaderp/PrefMisc$52;)V

    invoke-direct {p1, v0, v1, v2, v3}, Lcom/flyersoft/moonreaderp/PrefFolderPick;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lcom/flyersoft/moonreaderp/PrefFolderPick$OnGetFolder;)V

    const/4 v0, 0x1

    .line 1462
    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefFolderPick;->setFontsOnly(Z)Lcom/flyersoft/moonreaderp/PrefFolderPick;

    move-result-object p1

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefFolderPick;->show()V

    return-void
.end method
