.class public Lcom/radaee/util/FileBrowserView$FileBrowserAdt;
.super Landroid/widget/BaseAdapter;
.source "FileBrowserView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/radaee/util/FileBrowserView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "FileBrowserAdt"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/radaee/util/FileBrowserView$FileBrowserAdt$SnatchItem;
    }
.end annotation


# static fields
.field static TEXT_COLOR:I = -0x777778

.field static m_def_dir_icon:Landroid/graphics/Bitmap;

.field static m_def_file_icon:Landroid/graphics/Bitmap;

.field static m_def_refresh_icon:Landroid/graphics/Bitmap;

.field static m_def_up_icon:Landroid/graphics/Bitmap;


# instance fields
.field private final m_context:Landroid/content/Context;

.field private final m_filters:[Ljava/lang/String;

.field private final m_items:Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Vector<",
            "Lcom/radaee/util/FileBrowserView$FileBrowserAdt$SnatchItem;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;[Ljava/lang/String;)V
    .locals 1

    .line 210
    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 100
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lcom/radaee/util/FileBrowserView$FileBrowserAdt;->m_items:Ljava/util/Vector;

    .line 211
    iput-object p1, p0, Lcom/radaee/util/FileBrowserView$FileBrowserAdt;->m_context:Landroid/content/Context;

    .line 212
    iput-object p2, p0, Lcom/radaee/util/FileBrowserView$FileBrowserAdt;->m_filters:[Ljava/lang/String;

    return-void
.end method

.method private insert_item(Lcom/radaee/util/FileBrowserView$FileBrowserAdt$SnatchItem;)V
    .locals 5

    .line 104
    iget-object v0, p0, Lcom/radaee/util/FileBrowserView$FileBrowserAdt;->m_items:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    .line 105
    iget-object v1, p1, Lcom/radaee/util/FileBrowserView$FileBrowserAdt$SnatchItem;->m_item:Lcom/radaee/util/FileBrowserView$FileGridItem;

    invoke-virtual {v1}, Lcom/radaee/util/FileBrowserView$FileGridItem;->is_dir()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_3

    :goto_0
    if-gt v2, v0, :cond_7

    add-int v1, v2, v0

    shr-int/lit8 v1, v1, 0x1

    .line 108
    iget-object v3, p0, Lcom/radaee/util/FileBrowserView$FileBrowserAdt;->m_items:Ljava/util/Vector;

    invoke-virtual {v3, v1}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/radaee/util/FileBrowserView$FileBrowserAdt$SnatchItem;

    .line 109
    iget-object v4, v3, Lcom/radaee/util/FileBrowserView$FileBrowserAdt$SnatchItem;->m_item:Lcom/radaee/util/FileBrowserView$FileGridItem;

    invoke-virtual {v4}, Lcom/radaee/util/FileBrowserView$FileGridItem;->is_dir()Z

    move-result v4

    if-nez v4, :cond_1

    :cond_0
    add-int/lit8 v1, v1, -0x1

    move v0, v1

    goto :goto_0

    .line 112
    :cond_1
    iget-object v4, p1, Lcom/radaee/util/FileBrowserView$FileBrowserAdt$SnatchItem;->m_name:Ljava/lang/String;

    iget-object v3, v3, Lcom/radaee/util/FileBrowserView$FileBrowserAdt$SnatchItem;->m_name:Ljava/lang/String;

    invoke-virtual {v4, v3}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v3

    if-nez v3, :cond_2

    :goto_1
    move v2, v1

    goto :goto_4

    :cond_2
    if-lez v3, :cond_0

    add-int/lit8 v1, v1, 0x1

    move v2, v1

    goto :goto_0

    :cond_3
    :goto_2
    if-gt v2, v0, :cond_7

    add-int v1, v2, v0

    shr-int/lit8 v1, v1, 0x1

    .line 124
    iget-object v3, p0, Lcom/radaee/util/FileBrowserView$FileBrowserAdt;->m_items:Ljava/util/Vector;

    invoke-virtual {v3, v1}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/radaee/util/FileBrowserView$FileBrowserAdt$SnatchItem;

    .line 125
    iget-object v4, v3, Lcom/radaee/util/FileBrowserView$FileBrowserAdt$SnatchItem;->m_item:Lcom/radaee/util/FileBrowserView$FileGridItem;

    invoke-virtual {v4}, Lcom/radaee/util/FileBrowserView$FileGridItem;->is_dir()Z

    move-result v4

    if-eqz v4, :cond_4

    :goto_3
    add-int/lit8 v1, v1, 0x1

    move v2, v1

    goto :goto_2

    .line 128
    :cond_4
    iget-object v4, p1, Lcom/radaee/util/FileBrowserView$FileBrowserAdt$SnatchItem;->m_name:Ljava/lang/String;

    iget-object v3, v3, Lcom/radaee/util/FileBrowserView$FileBrowserAdt$SnatchItem;->m_name:Ljava/lang/String;

    invoke-virtual {v4, v3}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v3

    if-nez v3, :cond_5

    goto :goto_1

    :cond_5
    if-lez v3, :cond_6

    goto :goto_3

    :cond_6
    add-int/lit8 v1, v1, -0x1

    move v0, v1

    goto :goto_2

    .line 138
    :cond_7
    :goto_4
    iget-object v0, p0, Lcom/radaee/util/FileBrowserView$FileBrowserAdt;->m_items:Ljava/util/Vector;

    invoke-virtual {v0, p1, v2}, Ljava/util/Vector;->insertElementAt(Ljava/lang/Object;I)V

    return-void
.end method

.method private match_filter(Ljava/lang/String;)Z
    .locals 6

    .line 200
    iget-object v0, p0, Lcom/radaee/util/FileBrowserView$FileBrowserAdt;->m_filters:[Ljava/lang/String;

    const/4 v1, 0x1

    if-nez v0, :cond_0

    return v1

    .line 201
    :cond_0
    const-string v0, "."

    invoke-virtual {p1, v0}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v0

    const/4 v2, 0x0

    if-gez v0, :cond_1

    return v2

    .line 203
    :cond_1
    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    .line 205
    iget-object v0, p0, Lcom/radaee/util/FileBrowserView$FileBrowserAdt;->m_filters:[Ljava/lang/String;

    array-length v3, v0

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v3, :cond_3

    aget-object v5, v0, v4

    .line 206
    invoke-virtual {p1, v5}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v5

    if-nez v5, :cond_2

    return v1

    :cond_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_3
    return v2
.end method


# virtual methods
.method public destroy()V
    .locals 1

    .line 142
    iget-object v0, p0, Lcom/radaee/util/FileBrowserView$FileBrowserAdt;->m_items:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->clear()V

    return-void
.end method

.method public getCount()I
    .locals 1

    .line 224
    iget-object v0, p0, Lcom/radaee/util/FileBrowserView$FileBrowserAdt;->m_items:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->size()I

    move-result v0

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 1

    .line 228
    iget-object v0, p0, Lcom/radaee/util/FileBrowserView$FileBrowserAdt;->m_items:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public getItemId(I)J
    .locals 2

    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 236
    iget-object p2, p0, Lcom/radaee/util/FileBrowserView$FileBrowserAdt;->m_items:Ljava/util/Vector;

    invoke-virtual {p2, p1}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/radaee/util/FileBrowserView$FileBrowserAdt$SnatchItem;

    iget-object p1, p1, Lcom/radaee/util/FileBrowserView$FileBrowserAdt$SnatchItem;->m_item:Lcom/radaee/util/FileBrowserView$FileGridItem;

    return-object p1
.end method

.method public set_dir(Ljava/io/File;Z)V
    .locals 6

    .line 146
    iget-object v0, p0, Lcom/radaee/util/FileBrowserView$FileBrowserAdt;->m_items:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->clear()V

    .line 148
    new-instance v0, Lcom/radaee/util/FileBrowserView$FileBrowserAdt$SnatchItem;

    invoke-direct {v0}, Lcom/radaee/util/FileBrowserView$FileBrowserAdt$SnatchItem;-><init>()V

    .line 149
    const-string v1, "."

    iput-object v1, v0, Lcom/radaee/util/FileBrowserView$FileBrowserAdt$SnatchItem;->m_name:Ljava/lang/String;

    const/4 v1, 0x0

    .line 150
    iput-object v1, v0, Lcom/radaee/util/FileBrowserView$FileBrowserAdt$SnatchItem;->m_path:Ljava/lang/String;

    .line 151
    new-instance v2, Lcom/radaee/util/FileBrowserView$FileGridItem;

    iget-object v3, p0, Lcom/radaee/util/FileBrowserView$FileBrowserAdt;->m_context:Landroid/content/Context;

    invoke-direct {v2, v3, v1}, Lcom/radaee/util/FileBrowserView$FileGridItem;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    iput-object v2, v0, Lcom/radaee/util/FileBrowserView$FileBrowserAdt$SnatchItem;->m_item:Lcom/radaee/util/FileBrowserView$FileGridItem;

    .line 152
    iget-object v2, v0, Lcom/radaee/util/FileBrowserView$FileBrowserAdt$SnatchItem;->m_item:Lcom/radaee/util/FileBrowserView$FileGridItem;

    iget-object v3, v0, Lcom/radaee/util/FileBrowserView$FileBrowserAdt$SnatchItem;->m_name:Ljava/lang/String;

    iget-object v4, v0, Lcom/radaee/util/FileBrowserView$FileBrowserAdt$SnatchItem;->m_path:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Lcom/radaee/util/FileBrowserView$FileGridItem;->set_dir(Ljava/lang/String;Ljava/lang/String;)V

    .line 153
    invoke-direct {p0, v0}, Lcom/radaee/util/FileBrowserView$FileBrowserAdt;->insert_item(Lcom/radaee/util/FileBrowserView$FileBrowserAdt$SnatchItem;)V

    if-eqz p2, :cond_0

    .line 156
    new-instance p2, Lcom/radaee/util/FileBrowserView$FileBrowserAdt$SnatchItem;

    invoke-direct {p2}, Lcom/radaee/util/FileBrowserView$FileBrowserAdt$SnatchItem;-><init>()V

    .line 157
    const-string v0, ".."

    iput-object v0, p2, Lcom/radaee/util/FileBrowserView$FileBrowserAdt$SnatchItem;->m_name:Ljava/lang/String;

    .line 158
    iput-object v1, p2, Lcom/radaee/util/FileBrowserView$FileBrowserAdt$SnatchItem;->m_path:Ljava/lang/String;

    .line 159
    new-instance v0, Lcom/radaee/util/FileBrowserView$FileGridItem;

    iget-object v2, p0, Lcom/radaee/util/FileBrowserView$FileBrowserAdt;->m_context:Landroid/content/Context;

    invoke-direct {v0, v2, v1}, Lcom/radaee/util/FileBrowserView$FileGridItem;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    iput-object v0, p2, Lcom/radaee/util/FileBrowserView$FileBrowserAdt$SnatchItem;->m_item:Lcom/radaee/util/FileBrowserView$FileGridItem;

    .line 160
    iget-object v0, p2, Lcom/radaee/util/FileBrowserView$FileBrowserAdt$SnatchItem;->m_item:Lcom/radaee/util/FileBrowserView$FileGridItem;

    iget-object v2, p2, Lcom/radaee/util/FileBrowserView$FileBrowserAdt$SnatchItem;->m_name:Ljava/lang/String;

    iget-object v3, p2, Lcom/radaee/util/FileBrowserView$FileBrowserAdt$SnatchItem;->m_path:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Lcom/radaee/util/FileBrowserView$FileGridItem;->set_dir(Ljava/lang/String;Ljava/lang/String;)V

    .line 161
    invoke-direct {p0, p2}, Lcom/radaee/util/FileBrowserView$FileBrowserAdt;->insert_item(Lcom/radaee/util/FileBrowserView$FileBrowserAdt$SnatchItem;)V

    .line 164
    :cond_0
    invoke-virtual {p1}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object p1

    if-nez p1, :cond_1

    .line 166
    invoke-virtual {p0}, Lcom/radaee/util/FileBrowserView$FileBrowserAdt;->notifyDataSetChanged()V

    return-void

    .line 170
    :cond_1
    array-length p2, p1

    const/4 v0, 0x0

    :goto_0
    if-ge v0, p2, :cond_5

    .line 173
    aget-object v2, p1, v0

    invoke-virtual {v2}, Ljava/io/File;->isHidden()Z

    move-result v2

    if-eqz v2, :cond_3

    :cond_2
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 177
    :cond_3
    aget-object v2, p1, v0

    invoke-virtual {v2}, Ljava/io/File;->isFile()Z

    move-result v2

    if-eqz v2, :cond_4

    aget-object v2, p1, v0

    invoke-virtual {v2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/radaee/util/FileBrowserView$FileBrowserAdt;->match_filter(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 179
    new-instance v2, Lcom/radaee/util/FileBrowserView$FileBrowserAdt$SnatchItem;

    invoke-direct {v2}, Lcom/radaee/util/FileBrowserView$FileBrowserAdt$SnatchItem;-><init>()V

    .line 180
    aget-object v3, p1, v0

    invoke-virtual {v3}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/radaee/util/FileBrowserView$FileBrowserAdt$SnatchItem;->m_name:Ljava/lang/String;

    .line 181
    aget-object v3, p1, v0

    invoke-virtual {v3}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/radaee/util/FileBrowserView$FileBrowserAdt$SnatchItem;->m_path:Ljava/lang/String;

    .line 182
    new-instance v3, Lcom/radaee/util/FileBrowserView$FileGridItem;

    iget-object v4, p0, Lcom/radaee/util/FileBrowserView$FileBrowserAdt;->m_context:Landroid/content/Context;

    invoke-direct {v3, v4, v1}, Lcom/radaee/util/FileBrowserView$FileGridItem;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    iput-object v3, v2, Lcom/radaee/util/FileBrowserView$FileBrowserAdt$SnatchItem;->m_item:Lcom/radaee/util/FileBrowserView$FileGridItem;

    .line 183
    iget-object v3, v2, Lcom/radaee/util/FileBrowserView$FileBrowserAdt$SnatchItem;->m_item:Lcom/radaee/util/FileBrowserView$FileGridItem;

    iget-object v4, v2, Lcom/radaee/util/FileBrowserView$FileBrowserAdt$SnatchItem;->m_name:Ljava/lang/String;

    iget-object v5, v2, Lcom/radaee/util/FileBrowserView$FileBrowserAdt$SnatchItem;->m_path:Ljava/lang/String;

    invoke-virtual {v3, v4, v5}, Lcom/radaee/util/FileBrowserView$FileGridItem;->set_file(Ljava/lang/String;Ljava/lang/String;)V

    .line 184
    invoke-direct {p0, v2}, Lcom/radaee/util/FileBrowserView$FileBrowserAdt;->insert_item(Lcom/radaee/util/FileBrowserView$FileBrowserAdt$SnatchItem;)V

    .line 186
    :cond_4
    aget-object v2, p1, v0

    invoke-virtual {v2}, Ljava/io/File;->isDirectory()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 187
    new-instance v2, Lcom/radaee/util/FileBrowserView$FileBrowserAdt$SnatchItem;

    invoke-direct {v2}, Lcom/radaee/util/FileBrowserView$FileBrowserAdt$SnatchItem;-><init>()V

    .line 188
    aget-object v3, p1, v0

    invoke-virtual {v3}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/radaee/util/FileBrowserView$FileBrowserAdt$SnatchItem;->m_name:Ljava/lang/String;

    .line 189
    aget-object v3, p1, v0

    invoke-virtual {v3}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/radaee/util/FileBrowserView$FileBrowserAdt$SnatchItem;->m_path:Ljava/lang/String;

    .line 190
    new-instance v3, Lcom/radaee/util/FileBrowserView$FileGridItem;

    iget-object v4, p0, Lcom/radaee/util/FileBrowserView$FileBrowserAdt;->m_context:Landroid/content/Context;

    invoke-direct {v3, v4, v1}, Lcom/radaee/util/FileBrowserView$FileGridItem;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    iput-object v3, v2, Lcom/radaee/util/FileBrowserView$FileBrowserAdt$SnatchItem;->m_item:Lcom/radaee/util/FileBrowserView$FileGridItem;

    .line 191
    iget-object v3, v2, Lcom/radaee/util/FileBrowserView$FileBrowserAdt$SnatchItem;->m_item:Lcom/radaee/util/FileBrowserView$FileGridItem;

    iget-object v4, v2, Lcom/radaee/util/FileBrowserView$FileBrowserAdt$SnatchItem;->m_name:Ljava/lang/String;

    iget-object v5, v2, Lcom/radaee/util/FileBrowserView$FileBrowserAdt$SnatchItem;->m_path:Ljava/lang/String;

    invoke-virtual {v3, v4, v5}, Lcom/radaee/util/FileBrowserView$FileGridItem;->set_dir(Ljava/lang/String;Ljava/lang/String;)V

    .line 192
    invoke-direct {p0, v2}, Lcom/radaee/util/FileBrowserView$FileBrowserAdt;->insert_item(Lcom/radaee/util/FileBrowserView$FileBrowserAdt$SnatchItem;)V

    goto :goto_1

    .line 196
    :cond_5
    invoke-virtual {p0}, Lcom/radaee/util/FileBrowserView$FileBrowserAdt;->notifyDataSetChanged()V

    return-void
.end method
