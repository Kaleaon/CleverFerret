.class public Lcom/radaee/util/ComboListAdt;
.super Ljava/lang/Object;
.source "ComboListAdt.java"

# interfaces
.implements Landroid/widget/ListAdapter;


# static fields
.field protected static back_color:I = -0x40


# instance fields
.field private m_obs:Landroid/database/DataSetObserver;

.field private m_opts:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 12
    iput-object v0, p0, Lcom/radaee/util/ComboListAdt;->m_obs:Landroid/database/DataSetObserver;

    .line 13
    iput-object v0, p0, Lcom/radaee/util/ComboListAdt;->m_opts:[Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public areAllItemsEnabled()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public getCount()I
    .locals 1

    .line 22
    iget-object v0, p0, Lcom/radaee/util/ComboListAdt;->m_opts:[Ljava/lang/String;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    .line 23
    :cond_0
    array-length v0, v0

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 1

    .line 28
    iget-object v0, p0, Lcom/radaee/util/ComboListAdt;->m_opts:[Ljava/lang/String;

    aget-object p1, v0, p1

    return-object p1
.end method

.method public getItemId(I)J
    .locals 2

    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public getItemViewType(I)I
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 43
    new-instance p2, Landroid/widget/TextView;

    invoke-virtual {p3}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p3

    invoke-direct {p2, p3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 44
    iget-object p3, p0, Lcom/radaee/util/ComboListAdt;->m_opts:[Ljava/lang/String;

    aget-object p1, p3, p1

    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 p1, -0x1000000

    .line 45
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setTextColor(I)V

    const/16 p1, -0x40

    .line 46
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setBackgroundColor(I)V

    return-object p2
.end method

.method public getViewTypeCount()I
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public hasStableIds()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public isEmpty()Z
    .locals 1

    .line 62
    iget-object v0, p0, Lcom/radaee/util/ComboListAdt;->m_opts:[Ljava/lang/String;

    if-eqz v0, :cond_1

    array-length v0, v0

    if-lez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    return v0

    :cond_1
    :goto_0
    const/4 v0, 0x1

    return v0
.end method

.method public isEnabled(I)Z
    .locals 0

    const/4 p1, 0x1

    return p1
.end method

.method public registerDataSetObserver(Landroid/database/DataSetObserver;)V
    .locals 0

    .line 67
    iput-object p1, p0, Lcom/radaee/util/ComboListAdt;->m_obs:Landroid/database/DataSetObserver;

    return-void
.end method

.method public set_opts([Ljava/lang/String;)V
    .locals 0

    .line 17
    iput-object p1, p0, Lcom/radaee/util/ComboListAdt;->m_opts:[Ljava/lang/String;

    .line 18
    iget-object p1, p0, Lcom/radaee/util/ComboListAdt;->m_obs:Landroid/database/DataSetObserver;

    invoke-virtual {p1}, Landroid/database/DataSetObserver;->onChanged()V

    return-void
.end method

.method public unregisterDataSetObserver(Landroid/database/DataSetObserver;)V
    .locals 0

    const/4 p1, 0x0

    .line 72
    iput-object p1, p0, Lcom/radaee/util/ComboListAdt;->m_obs:Landroid/database/DataSetObserver;

    return-void
.end method
