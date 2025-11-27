.class public Lcom/flyersoft/components/DictPackage$DictItem;
.super Ljava/lang/Object;
.source "DictPackage.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/DictPackage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "DictItem"
.end annotation


# instance fields
.field public appName:Ljava/lang/String;

.field public clsName:Ljava/lang/String;

.field public info:Landroid/content/pm/ResolveInfo;

.field public label:Ljava/lang/String;

.field public ok:Z

.field public pkgName:Ljava/lang/String;

.field public type:I


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILandroid/content/pm/ResolveInfo;)V
    .locals 0

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    iput-object p1, p0, Lcom/flyersoft/components/DictPackage$DictItem;->pkgName:Ljava/lang/String;

    .line 40
    iput-object p2, p0, Lcom/flyersoft/components/DictPackage$DictItem;->clsName:Ljava/lang/String;

    .line 41
    iput-object p3, p0, Lcom/flyersoft/components/DictPackage$DictItem;->label:Ljava/lang/String;

    .line 42
    iput p4, p0, Lcom/flyersoft/components/DictPackage$DictItem;->type:I

    .line 43
    iput-object p5, p0, Lcom/flyersoft/components/DictPackage$DictItem;->info:Landroid/content/pm/ResolveInfo;

    return-void
.end method
