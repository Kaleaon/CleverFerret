.class public Lcom/flyersoft/components/DictPackage$AppListAdapter;
.super Landroid/widget/BaseAdapter;
.source "DictPackage.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/DictPackage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "AppListAdapter"
.end annotation


# instance fields
.field mContext:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 287
    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 288
    iput-object p1, p0, Lcom/flyersoft/components/DictPackage$AppListAdapter;->mContext:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .line 292
    sget-object v0, Lcom/flyersoft/components/DictPackage;->dictList:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/flyersoft/components/DictPackage;->dictList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 0

    .line 296
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    return-object p1
.end method

.method public getItemId(I)J
    .locals 2

    int-to-long v0, p1

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 3

    if-eqz p2, :cond_0

    goto :goto_0

    .line 305
    :cond_0
    iget-object p2, p0, Lcom/flyersoft/components/DictPackage$AppListAdapter;->mContext:Landroid/content/Context;

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    sget p3, Lcom/flyersoft/moonreaderp/R$layout;->select_app_item:I

    const/4 v0, 0x0

    invoke-virtual {p2, p3, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p2

    .line 306
    :goto_0
    sget-object p3, Lcom/flyersoft/components/DictPackage;->dictList:Ljava/util/ArrayList;

    invoke-virtual {p3, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/components/DictPackage$DictItem;

    .line 307
    sget p3, Lcom/flyersoft/moonreaderp/R$id;->iv:I

    invoke-virtual {p2, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p3

    check-cast p3, Landroid/widget/ImageView;

    const v0, 0x1020014

    .line 308
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 309
    invoke-static {p2}, Lcom/flyersoft/tools/A;->checkNightTextColors(Landroid/view/View;)V

    .line 310
    iget-object v1, p1, Lcom/flyersoft/components/DictPackage$DictItem;->info:Landroid/content/pm/ResolveInfo;

    iget-object v2, p0, Lcom/flyersoft/components/DictPackage$AppListAdapter;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/content/pm/ResolveInfo;->loadIcon(Landroid/content/pm/PackageManager;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {p3, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 311
    iget-object p1, p1, Lcom/flyersoft/components/DictPackage$DictItem;->label:Ljava/lang/String;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 312
    invoke-static {}, Lcom/flyersoft/tools/A;->getScreenWidth()I

    move-result p1

    invoke-virtual {p2, p1}, Landroid/view/View;->setMinimumWidth(I)V

    return-object p2
.end method
