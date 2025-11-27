.class Lcom/facebook/soloader/Elf64$Phdr;
.super Ljava/lang/Object;
.source "Elf64.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/soloader/Elf64;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Phdr"
.end annotation


# static fields
.field public static final P_ALIGN:I = 0x30

.field public static final P_FILESZ:I = 0x20

.field public static final P_FLAGS:I = 0x4

.field public static final P_MEMSZ:I = 0x28

.field public static final P_OFFSET:I = 0x8

.field public static final P_PADDR:I = 0x18

.field public static final P_TYPE:I = 0x0

.field public static final P_VADDR:I = 0x10


# direct methods
.method constructor <init>()V
    .locals 0

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
