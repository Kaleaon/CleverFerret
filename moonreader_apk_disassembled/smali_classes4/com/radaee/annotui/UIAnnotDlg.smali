.class public Lcom/radaee/annotui/UIAnnotDlg;
.super Landroid/app/AlertDialog$Builder;
.source "UIAnnotDlg.java"


# instance fields
.field protected m_annot:Lcom/radaee/pdf/Page$Annotation;

.field protected m_callback:Lcom/radaee/annotui/UIAnnotMenu$IMemnuCallback;

.field protected m_layout:Landroid/widget/RelativeLayout;


# direct methods
.method public constructor <init>(Landroid/widget/RelativeLayout;)V
    .locals 1

    .line 14
    invoke-virtual {p1}, Landroid/widget/RelativeLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 15
    invoke-virtual {p0, p1}, Lcom/radaee/annotui/UIAnnotDlg;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    .line 16
    iput-object p1, p0, Lcom/radaee/annotui/UIAnnotDlg;->m_layout:Landroid/widget/RelativeLayout;

    return-void
.end method
