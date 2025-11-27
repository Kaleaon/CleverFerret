.class Lcom/flyersoft/components/DictPackage$1;
.super Ljava/lang/Object;
.source "DictPackage.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/DictPackage;->showDictApps(Landroid/content/Context;Ljava/lang/String;Landroid/widget/TextView;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$con:Landroid/content/Context;

.field final synthetic val$describTv:Landroid/widget/TextView;

.field final synthetic val$isLongTap:Z

.field final synthetic val$word:Ljava/lang/String;


# direct methods
.method constructor <init>(ZLandroid/content/Context;Ljava/lang/String;Landroid/widget/TextView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 114
    iput-boolean p1, p0, Lcom/flyersoft/components/DictPackage$1;->val$isLongTap:Z

    iput-object p2, p0, Lcom/flyersoft/components/DictPackage$1;->val$con:Landroid/content/Context;

    iput-object p3, p0, Lcom/flyersoft/components/DictPackage$1;->val$word:Ljava/lang/String;

    iput-object p4, p0, Lcom/flyersoft/components/DictPackage$1;->val$describTv:Landroid/widget/TextView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3

    .line 116
    sget-object v0, Lcom/flyersoft/components/DictPackage;->dictList:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/flyersoft/components/DictPackage$DictItem;

    .line 117
    iget-boolean v0, p0, Lcom/flyersoft/components/DictPackage$1;->val$isLongTap:Z

    invoke-static {p2, v0}, Lcom/flyersoft/components/DictPackage;->saveDictIntent(Lcom/flyersoft/components/DictPackage$DictItem;Z)V

    .line 118
    iget-object p2, p0, Lcom/flyersoft/components/DictPackage$1;->val$con:Landroid/content/Context;

    iget-object v0, p0, Lcom/flyersoft/components/DictPackage$1;->val$word:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "test"

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/flyersoft/components/DictPackage$1;->val$word:Ljava/lang/String;

    :goto_0
    iget-boolean v1, p0, Lcom/flyersoft/components/DictPackage$1;->val$isLongTap:Z

    invoke-static {p2, v0, v1}, Lcom/flyersoft/components/DictPackage;->lookupFromSavedDictIntent(Landroid/content/Context;Ljava/lang/String;Z)V

    .line 119
    iget-object p2, p0, Lcom/flyersoft/components/DictPackage$1;->val$describTv:Landroid/widget/TextView;

    if-eqz p2, :cond_1

    .line 120
    iget-object v0, p0, Lcom/flyersoft/components/DictPackage$1;->val$con:Landroid/content/Context;

    const/4 v1, 0x1

    iget-boolean v2, p0, Lcom/flyersoft/components/DictPackage$1;->val$isLongTap:Z

    invoke-static {v0, v1, v2}, Lcom/flyersoft/components/DictPackage;->getInstalledDictName(Landroid/content/Context;ZZ)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 121
    :cond_1
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    return-void
.end method
