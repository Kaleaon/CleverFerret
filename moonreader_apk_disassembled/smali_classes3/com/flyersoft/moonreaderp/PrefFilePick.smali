.class public Lcom/flyersoft/moonreaderp/PrefFilePick;
.super Ljava/lang/Object;
.source "PrefFilePick.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/moonreaderp/PrefFilePick$OnGetFile;
    }
.end annotation


# instance fields
.field dlg:Lcom/flyersoft/components/MyDialog;

.field filter:Ljava/lang/String;

.field lastFolder:Ljava/lang/String;

.field onFileChanged:Lcom/flyersoft/moonreaderp/PrefFilePick$OnGetFile;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lcom/flyersoft/moonreaderp/PrefFilePick$OnGetFile;)V
    .locals 7

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    invoke-static {p3}, Lcom/flyersoft/tools/T;->getFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFilePick;->lastFolder:Ljava/lang/String;

    .line 20
    new-instance v5, Lcom/flyersoft/views/EditViewReadOnly;

    invoke-direct {v5, p1}, Lcom/flyersoft/views/EditViewReadOnly;-><init>(Landroid/content/Context;)V

    .line 21
    invoke-virtual {v5, p3}, Lcom/flyersoft/views/EditViewReadOnly;->setText(Ljava/lang/CharSequence;)V

    .line 22
    new-instance v1, Lcom/flyersoft/moonreaderp/PrefFilePick$1;

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move-object v6, p3

    invoke-direct/range {v1 .. v6}, Lcom/flyersoft/moonreaderp/PrefFilePick$1;-><init>(Lcom/flyersoft/moonreaderp/PrefFilePick;Landroid/content/Context;Ljava/lang/String;Lcom/flyersoft/views/EditViewReadOnly;Ljava/lang/String;)V

    invoke-virtual {v5, v1}, Lcom/flyersoft/views/EditViewReadOnly;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 38
    new-instance p1, Lcom/flyersoft/components/MyDialog;

    invoke-direct {p1, v3}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    invoke-virtual {p1, v4}, Lcom/flyersoft/components/MyDialog;->setTitle(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    invoke-virtual {p1, v5}, Lcom/flyersoft/components/MyDialog;->setView(Landroid/view/View;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    new-instance p2, Lcom/flyersoft/moonreaderp/PrefFilePick$2;

    invoke-direct {p2, p0, p4, v5}, Lcom/flyersoft/moonreaderp/PrefFilePick$2;-><init>(Lcom/flyersoft/moonreaderp/PrefFilePick;Lcom/flyersoft/moonreaderp/PrefFilePick$OnGetFile;Lcom/flyersoft/views/EditViewReadOnly;)V

    const p3, 0x104000a

    .line 39
    invoke-virtual {p1, p3, p2}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    const/high16 p2, 0x1040000

    const/4 p3, 0x0

    .line 45
    invoke-virtual {p1, p2, p3}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    iput-object p1, v2, Lcom/flyersoft/moonreaderp/PrefFilePick;->dlg:Lcom/flyersoft/components/MyDialog;

    return-void
.end method


# virtual methods
.method public dismiss()V
    .locals 1

    .line 49
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFilePick;->dlg:Lcom/flyersoft/components/MyDialog;

    invoke-virtual {v0}, Lcom/flyersoft/components/MyDialog;->dismiss()V

    return-void
.end method

.method public setFilter(Ljava/lang/String;)Lcom/flyersoft/moonreaderp/PrefFilePick;
    .locals 0

    .line 57
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFilePick;->filter:Ljava/lang/String;

    return-object p0
.end method

.method public setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)Lcom/flyersoft/moonreaderp/PrefFilePick;
    .locals 1

    .line 67
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFilePick;->dlg:Lcom/flyersoft/components/MyDialog;

    invoke-virtual {v0, p1}, Lcom/flyersoft/components/MyDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)Lcom/flyersoft/components/MyDialog;

    return-object p0
.end method

.method public setOnFileChanged(Lcom/flyersoft/moonreaderp/PrefFilePick$OnGetFile;)Lcom/flyersoft/moonreaderp/PrefFilePick;
    .locals 0

    .line 62
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFilePick;->onFileChanged:Lcom/flyersoft/moonreaderp/PrefFilePick$OnGetFile;

    return-object p0
.end method

.method public show()Lcom/flyersoft/moonreaderp/PrefFilePick;
    .locals 1

    .line 72
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFilePick;->dlg:Lcom/flyersoft/components/MyDialog;

    invoke-virtual {v0}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    return-object p0
.end method
