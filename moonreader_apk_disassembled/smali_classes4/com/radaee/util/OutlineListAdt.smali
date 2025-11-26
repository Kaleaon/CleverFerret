.class public Lcom/radaee/util/OutlineListAdt;
.super Ljava/lang/Object;
.source "OutlineListAdt.java"

# interfaces
.implements Landroid/widget/ListAdapter;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/radaee/util/OutlineListAdt$OutlineRec;,
        Lcom/radaee/util/OutlineListAdt$outline_ui_item;
    }
.end annotation


# instance fields
.field private m_ctx:Landroid/content/Context;

.field private m_cur:Lcom/radaee/util/OutlineListAdt$OutlineRec;

.field private m_doc:Lcom/radaee/pdf/Document;

.field private m_items:[Lcom/radaee/util/OutlineListAdt$outline_ui_item;

.field private m_obs:Landroid/database/DataSetObserver;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 130
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 21
    iput-object v0, p0, Lcom/radaee/util/OutlineListAdt;->m_obs:Landroid/database/DataSetObserver;

    .line 131
    iput-object p1, p0, Lcom/radaee/util/OutlineListAdt;->m_ctx:Landroid/content/Context;

    return-void
.end method

.method static synthetic access$300(Lcom/radaee/util/OutlineListAdt;)Lcom/radaee/util/OutlineListAdt$OutlineRec;
    .locals 0

    .line 18
    iget-object p0, p0, Lcom/radaee/util/OutlineListAdt;->m_cur:Lcom/radaee/util/OutlineListAdt$OutlineRec;

    return-object p0
.end method

.method static synthetic access$302(Lcom/radaee/util/OutlineListAdt;Lcom/radaee/util/OutlineListAdt$OutlineRec;)Lcom/radaee/util/OutlineListAdt$OutlineRec;
    .locals 0

    .line 18
    iput-object p1, p0, Lcom/radaee/util/OutlineListAdt;->m_cur:Lcom/radaee/util/OutlineListAdt$OutlineRec;

    return-object p1
.end method

.method static synthetic access$400(Lcom/radaee/util/OutlineListAdt;)V
    .locals 0

    .line 18
    invoke-direct {p0}, Lcom/radaee/util/OutlineListAdt;->refresh()V

    return-void
.end method

.method private refresh()V
    .locals 10

    const/4 v0, 0x0

    .line 95
    iput-object v0, p0, Lcom/radaee/util/OutlineListAdt;->m_items:[Lcom/radaee/util/OutlineListAdt$outline_ui_item;

    .line 96
    iget-object v1, p0, Lcom/radaee/util/OutlineListAdt;->m_cur:Lcom/radaee/util/OutlineListAdt$OutlineRec;

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-nez v1, :cond_2

    .line 99
    iget-object v1, p0, Lcom/radaee/util/OutlineListAdt;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v1}, Lcom/radaee/pdf/Document;->GetOutlines()Lcom/radaee/pdf/Document$Outline;

    move-result-object v1

    const/4 v4, 0x0

    :goto_0
    if-eqz v1, :cond_0

    add-int/lit8 v4, v4, 0x1

    invoke-virtual {v1}, Lcom/radaee/pdf/Document$Outline;->GetNext()Lcom/radaee/pdf/Document$Outline;

    move-result-object v1

    goto :goto_0

    :cond_0
    if-lez v4, :cond_1

    .line 103
    new-array v1, v4, [Lcom/radaee/util/OutlineListAdt$outline_ui_item;

    iput-object v1, p0, Lcom/radaee/util/OutlineListAdt;->m_items:[Lcom/radaee/util/OutlineListAdt$outline_ui_item;

    .line 105
    iget-object v1, p0, Lcom/radaee/util/OutlineListAdt;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v1}, Lcom/radaee/pdf/Document;->GetOutlines()Lcom/radaee/pdf/Document$Outline;

    move-result-object v1

    :goto_1
    if-eqz v1, :cond_1

    .line 107
    iget-object v4, p0, Lcom/radaee/util/OutlineListAdt;->m_items:[Lcom/radaee/util/OutlineListAdt$outline_ui_item;

    new-instance v5, Lcom/radaee/util/OutlineListAdt$outline_ui_item;

    iget-object v6, p0, Lcom/radaee/util/OutlineListAdt;->m_ctx:Landroid/content/Context;

    invoke-direct {v5, p0, v6, v1, v0}, Lcom/radaee/util/OutlineListAdt$outline_ui_item;-><init>(Lcom/radaee/util/OutlineListAdt;Landroid/content/Context;Lcom/radaee/pdf/Document$Outline;Lcom/radaee/util/OutlineListAdt$1;)V

    aput-object v5, v4, v2

    add-int/2addr v2, v3

    .line 105
    invoke-virtual {v1}, Lcom/radaee/pdf/Document$Outline;->GetNext()Lcom/radaee/pdf/Document$Outline;

    move-result-object v1

    goto :goto_1

    :cond_1
    move-object v5, p0

    goto :goto_4

    .line 115
    :cond_2
    invoke-static {v1}, Lcom/radaee/util/OutlineListAdt$OutlineRec;->access$100(Lcom/radaee/util/OutlineListAdt$OutlineRec;)Lcom/radaee/pdf/Document$Outline;

    move-result-object v1

    invoke-virtual {v1}, Lcom/radaee/pdf/Document$Outline;->GetChild()Lcom/radaee/pdf/Document$Outline;

    move-result-object v1

    const/4 v4, 0x1

    :goto_2
    if-eqz v1, :cond_3

    add-int/lit8 v4, v4, 0x1

    invoke-virtual {v1}, Lcom/radaee/pdf/Document$Outline;->GetNext()Lcom/radaee/pdf/Document$Outline;

    move-result-object v1

    goto :goto_2

    .line 117
    :cond_3
    new-array v1, v4, [Lcom/radaee/util/OutlineListAdt$outline_ui_item;

    iput-object v1, p0, Lcom/radaee/util/OutlineListAdt;->m_items:[Lcom/radaee/util/OutlineListAdt$outline_ui_item;

    .line 118
    new-instance v4, Lcom/radaee/util/OutlineListAdt$outline_ui_item;

    iget-object v6, p0, Lcom/radaee/util/OutlineListAdt;->m_ctx:Landroid/content/Context;

    const-string v8, "<parent>"

    const/4 v9, 0x0

    const/4 v7, 0x0

    move-object v5, p0

    invoke-direct/range {v4 .. v9}, Lcom/radaee/util/OutlineListAdt$outline_ui_item;-><init>(Lcom/radaee/util/OutlineListAdt;Landroid/content/Context;ILjava/lang/String;Lcom/radaee/util/OutlineListAdt$1;)V

    aput-object v4, v1, v2

    .line 120
    iget-object v1, v5, Lcom/radaee/util/OutlineListAdt;->m_cur:Lcom/radaee/util/OutlineListAdt$OutlineRec;

    invoke-static {v1}, Lcom/radaee/util/OutlineListAdt$OutlineRec;->access$100(Lcom/radaee/util/OutlineListAdt$OutlineRec;)Lcom/radaee/pdf/Document$Outline;

    move-result-object v1

    invoke-virtual {v1}, Lcom/radaee/pdf/Document$Outline;->GetChild()Lcom/radaee/pdf/Document$Outline;

    move-result-object v1

    const/4 v2, 0x1

    :goto_3
    if-eqz v1, :cond_4

    .line 122
    iget-object v4, v5, Lcom/radaee/util/OutlineListAdt;->m_items:[Lcom/radaee/util/OutlineListAdt$outline_ui_item;

    new-instance v6, Lcom/radaee/util/OutlineListAdt$outline_ui_item;

    iget-object v7, v5, Lcom/radaee/util/OutlineListAdt;->m_ctx:Landroid/content/Context;

    invoke-direct {v6, p0, v7, v1, v0}, Lcom/radaee/util/OutlineListAdt$outline_ui_item;-><init>(Lcom/radaee/util/OutlineListAdt;Landroid/content/Context;Lcom/radaee/pdf/Document$Outline;Lcom/radaee/util/OutlineListAdt$1;)V

    aput-object v6, v4, v2

    add-int/2addr v2, v3

    .line 120
    invoke-virtual {v1}, Lcom/radaee/pdf/Document$Outline;->GetNext()Lcom/radaee/pdf/Document$Outline;

    move-result-object v1

    goto :goto_3

    .line 126
    :cond_4
    :goto_4
    iget-object v0, v5, Lcom/radaee/util/OutlineListAdt;->m_obs:Landroid/database/DataSetObserver;

    if-eqz v0, :cond_5

    .line 127
    invoke-virtual {v0}, Landroid/database/DataSetObserver;->onChanged()V

    :cond_5
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

    .line 141
    iget-object v0, p0, Lcom/radaee/util/OutlineListAdt;->m_items:[Lcom/radaee/util/OutlineListAdt$outline_ui_item;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    .line 142
    :cond_0
    array-length v0, v0

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 1

    .line 147
    iget-object v0, p0, Lcom/radaee/util/OutlineListAdt;->m_items:[Lcom/radaee/util/OutlineListAdt$outline_ui_item;

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

    .line 162
    iget-object p2, p0, Lcom/radaee/util/OutlineListAdt;->m_items:[Lcom/radaee/util/OutlineListAdt$outline_ui_item;

    aget-object p1, p2, p1

    invoke-static {p1}, Lcom/radaee/util/OutlineListAdt$outline_ui_item;->access$700(Lcom/radaee/util/OutlineListAdt$outline_ui_item;)Landroid/widget/RelativeLayout;

    move-result-object p1

    return-object p1
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

    .line 177
    iget-object v0, p0, Lcom/radaee/util/OutlineListAdt;->m_items:[Lcom/radaee/util/OutlineListAdt$outline_ui_item;

    if-eqz v0, :cond_1

    array-length v0, v0

    if-gtz v0, :cond_0

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

    .line 183
    iput-object p1, p0, Lcom/radaee/util/OutlineListAdt;->m_obs:Landroid/database/DataSetObserver;

    return-void
.end method

.method public set_outlines(Lcom/radaee/pdf/Document;)V
    .locals 0

    .line 135
    iput-object p1, p0, Lcom/radaee/util/OutlineListAdt;->m_doc:Lcom/radaee/pdf/Document;

    const/4 p1, 0x0

    .line 136
    iput-object p1, p0, Lcom/radaee/util/OutlineListAdt;->m_cur:Lcom/radaee/util/OutlineListAdt$OutlineRec;

    .line 137
    invoke-direct {p0}, Lcom/radaee/util/OutlineListAdt;->refresh()V

    return-void
.end method

.method public unregisterDataSetObserver(Landroid/database/DataSetObserver;)V
    .locals 0

    const/4 p1, 0x0

    .line 188
    iput-object p1, p0, Lcom/radaee/util/OutlineListAdt;->m_obs:Landroid/database/DataSetObserver;

    return-void
.end method
