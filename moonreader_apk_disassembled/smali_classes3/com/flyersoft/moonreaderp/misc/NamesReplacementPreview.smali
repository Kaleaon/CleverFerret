.class public Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview;
.super Ljava/lang/Object;
.source "NamesReplacementPreview.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static show(Landroid/content/Context;Landroid/widget/LinearLayout;)V
    .locals 2

    .line 34
    new-instance v0, Lcom/flyersoft/components/MyDialog;

    invoke-direct {v0, p0}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    new-instance v1, Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView;

    invoke-direct {v1, p0, p1}, Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView;-><init>(Landroid/content/Context;Landroid/widget/LinearLayout;)V

    iget-object p0, v1, Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView;->root:Landroid/view/View;

    .line 36
    invoke-virtual {v0, p0}, Lcom/flyersoft/components/MyDialog;->setView(Landroid/view/View;)Lcom/flyersoft/components/MyDialog;

    move-result-object p0

    const p1, 0x104000a

    const/4 v0, 0x0

    .line 37
    invoke-virtual {p0, p1, v0}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p0

    invoke-virtual {p0}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    return-void
.end method
