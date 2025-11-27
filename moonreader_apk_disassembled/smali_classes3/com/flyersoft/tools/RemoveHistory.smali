.class public Lcom/flyersoft/tools/RemoveHistory;
.super Ljava/lang/Object;
.source "RemoveHistory.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/tools/RemoveHistory$HistoryAdapter;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static removeHistory(Landroid/content/Context;Ljava/lang/String;Ljava/util/ArrayList;Landroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnClickListener;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;",
            "Landroid/content/DialogInterface$OnClickListener;",
            "Landroid/content/DialogInterface$OnClickListener;",
            "Landroid/content/DialogInterface$OnClickListener;",
            ")V"
        }
    .end annotation

    .line 26
    invoke-static {p0}, Lcom/flyersoft/tools/A;->alertDialog(Landroid/content/Context;)Landroidx/appcompat/app/AlertDialog$Builder;

    move-result-object v0

    .line 27
    invoke-virtual {v0, p1}, Landroidx/appcompat/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroidx/appcompat/app/AlertDialog$Builder;

    move-result-object p1

    new-instance v1, Lcom/flyersoft/tools/RemoveHistory$HistoryAdapter;

    invoke-direct {v1, p0, p2, p4}, Lcom/flyersoft/tools/RemoveHistory$HistoryAdapter;-><init>(Landroid/content/Context;Ljava/util/ArrayList;Landroid/content/DialogInterface$OnClickListener;)V

    new-instance p2, Lcom/flyersoft/tools/RemoveHistory$2;

    invoke-direct {p2, p3}, Lcom/flyersoft/tools/RemoveHistory$2;-><init>(Landroid/content/DialogInterface$OnClickListener;)V

    invoke-virtual {p1, v1, p2}, Landroidx/appcompat/app/AlertDialog$Builder;->setAdapter(Landroid/widget/ListAdapter;Landroid/content/DialogInterface$OnClickListener;)Landroidx/appcompat/app/AlertDialog$Builder;

    move-result-object p1

    const/4 p2, 0x1

    .line 33
    invoke-virtual {p1, p2}, Landroidx/appcompat/app/AlertDialog$Builder;->setCancelable(Z)Landroidx/appcompat/app/AlertDialog$Builder;

    move-result-object p1

    sget p2, Lcom/flyersoft/moonreaderp/R$string;->clear_dict_history:I

    new-instance p3, Lcom/flyersoft/tools/RemoveHistory$1;

    invoke-direct {p3, p0, p5}, Lcom/flyersoft/tools/RemoveHistory$1;-><init>(Landroid/content/Context;Landroid/content/DialogInterface$OnClickListener;)V

    invoke-virtual {p1, p2, p3}, Landroidx/appcompat/app/AlertDialog$Builder;->setNeutralButton(ILandroid/content/DialogInterface$OnClickListener;)Landroidx/appcompat/app/AlertDialog$Builder;

    move-result-object p0

    const p1, 0x104000a

    const/4 p2, 0x0

    .line 45
    invoke-virtual {p0, p1, p2}, Landroidx/appcompat/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroidx/appcompat/app/AlertDialog$Builder;

    .line 47
    invoke-virtual {v0}, Landroidx/appcompat/app/AlertDialog$Builder;->show()Landroidx/appcompat/app/AlertDialog;

    move-result-object p0

    .line 48
    invoke-static {p0}, Lcom/flyersoft/components/MyDialog;->setDialogDynamicBackground(Landroid/app/Dialog;)V

    return-void
.end method
