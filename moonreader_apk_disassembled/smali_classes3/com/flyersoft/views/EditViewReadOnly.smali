.class public Lcom/flyersoft/views/EditViewReadOnly;
.super Landroid/widget/TextView;
.source "EditViewReadOnly.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 12
    invoke-direct {p0, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 13
    sget p1, Lcom/flyersoft/material/components/icons/R$drawable;->textfield_activated_holo_dark:I

    invoke-virtual {p0, p1}, Lcom/flyersoft/views/EditViewReadOnly;->setBackgroundResource(I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 17
    invoke-direct {p0, p1, p2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 18
    sget p1, Lcom/flyersoft/material/components/icons/R$drawable;->textfield_activated_holo_dark:I

    invoke-virtual {p0, p1}, Lcom/flyersoft/views/EditViewReadOnly;->setBackgroundResource(I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 22
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 23
    sget p1, Lcom/flyersoft/material/components/icons/R$drawable;->textfield_activated_holo_dark:I

    invoke-virtual {p0, p1}, Lcom/flyersoft/views/EditViewReadOnly;->setBackgroundResource(I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0

    .line 27
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/TextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 28
    sget p1, Lcom/flyersoft/material/components/icons/R$drawable;->textfield_activated_holo_dark:I

    invoke-virtual {p0, p1}, Lcom/flyersoft/views/EditViewReadOnly;->setBackgroundResource(I)V

    return-void
.end method
