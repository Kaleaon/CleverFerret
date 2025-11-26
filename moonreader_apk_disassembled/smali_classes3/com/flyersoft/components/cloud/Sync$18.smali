.class Lcom/flyersoft/components/cloud/Sync$18;
.super Ljava/lang/Object;
.source "Sync.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/cloud/Sync;->updateMyShelfBooksFinal(Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/List;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$con:Landroid/content/Context;

.field final synthetic val$items:[Ljava/lang/String;

.field final synthetic val$newBooks:Ljava/util/ArrayList;

.field final synthetic val$selected:[Z


# direct methods
.method constructor <init>(Landroid/content/Context;[Ljava/lang/String;[ZLjava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 928
    iput-object p1, p0, Lcom/flyersoft/components/cloud/Sync$18;->val$con:Landroid/content/Context;

    iput-object p2, p0, Lcom/flyersoft/components/cloud/Sync$18;->val$items:[Ljava/lang/String;

    iput-object p3, p0, Lcom/flyersoft/components/cloud/Sync$18;->val$selected:[Z

    iput-object p4, p0, Lcom/flyersoft/components/cloud/Sync$18;->val$newBooks:Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    .line 931
    new-instance p1, Lcom/flyersoft/components/MyDialog;

    iget-object v0, p0, Lcom/flyersoft/components/cloud/Sync$18;->val$con:Landroid/content/Context;

    invoke-direct {p1, v0}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    iget-object v0, p0, Lcom/flyersoft/components/cloud/Sync$18;->val$items:[Ljava/lang/String;

    iget-object v1, p0, Lcom/flyersoft/components/cloud/Sync$18;->val$selected:[Z

    new-instance v2, Lcom/flyersoft/components/cloud/Sync$18$2;

    invoke-direct {v2, p0}, Lcom/flyersoft/components/cloud/Sync$18$2;-><init>(Lcom/flyersoft/components/cloud/Sync$18;)V

    invoke-virtual {p1, v0, v1, v2}, Lcom/flyersoft/components/MyDialog;->setMultiChoiceItems([Ljava/lang/CharSequence;[ZLandroid/content/DialogInterface$OnMultiChoiceClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    const v0, 0x104000a

    const/4 v1, 0x0

    .line 936
    invoke-virtual {p1, v0, v1}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    new-instance v0, Lcom/flyersoft/components/cloud/Sync$18$1;

    invoke-direct {v0, p0}, Lcom/flyersoft/components/cloud/Sync$18$1;-><init>(Lcom/flyersoft/components/cloud/Sync$18;)V

    .line 937
    invoke-virtual {p1, v0}, Lcom/flyersoft/components/MyDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    .line 944
    invoke-virtual {p1}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    return-void
.end method
