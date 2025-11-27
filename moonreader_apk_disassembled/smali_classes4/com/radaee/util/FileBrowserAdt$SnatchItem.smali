.class public Lcom/radaee/util/FileBrowserAdt$SnatchItem;
.super Ljava/lang/Object;
.source "FileBrowserAdt.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/radaee/util/FileBrowserAdt;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SnatchItem"
.end annotation


# instance fields
.field public m_item:Lcom/radaee/util/FileBrowserAdt$FileGridItem;

.field public m_name:Ljava/lang/String;

.field public m_path:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 100
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
